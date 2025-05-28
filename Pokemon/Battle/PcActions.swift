class PcActions {
    static func turn(user: Trainer, pc: Trainer) {
        let userPokemon = user.getActivePokemon()
        let pcPokemon = pc.getActivePokemon()
        
        let bestMove = chooseMove(userPokemon: userPokemon, pcPokemon: pcPokemon)
        
        print("Best move: \(bestMove.getName())")
        
        let probableDamage = MoveManager.calculateDamage(from: pcPokemon, with: bestMove, to: userPokemon)
        let seeKill = probableDamage >= userPokemon.getCurrentHealth()
        
        print("See kill: \(seeKill)")
        
        if seeKill {
            pcUsedMove = bestMove
            return
        }
        
        if shouldHeal(trainer: pc, userPokemon: userPokemon, pcPokemon: pcPokemon) {
            print("Should heal")
            if let item =  heal(trainer: pc, pokemon: pcPokemon) {
                print("Healed with \(item.getName())")
                pcUsedMove = nil
                Music.musicPlayerHelper.play(song: Music.healM)
                battleUi.printBoard(pokemonB: userPokemon, pokemonF: pcPokemon, text: "Your opponent used \(item.getName())!")
                return
            }
        }
        
        if shouldSwitch(trainer: pc, userPokemon: userPokemon, pcPokemon: pcPokemon) {
            print("Should switch")
            if let new = changePokemon(team: pc.getTeam(), activePokemon: pcPokemon) {
                print("Switched to \(new.getName())")
                pcNewPokemon = new
                pcUsedMove = nil
                return
            }

        }
        
        pcUsedMove = bestMove
    }
    
    private static func heal(trainer: Trainer, pokemon: Pokemon) -> Item? {
        let missingHP = pokemon.getHealth() - pokemon.getCurrentHealth()
        let items = trainer.getBag().getItems()
            
        let potion = items.keys.first { $0.getName() == "Potion" }
        let superPotion = items.keys.first { $0.getName() == "Super Potion" }
        let hyperPotion = items.keys.first { $0.getName() == "Hyper Potion" }
            
        var bestItem: Item?

        if missingHP > 60, let hyperPotion, items[hyperPotion]! > 0 {
            bestItem = hyperPotion
        } else if missingHP > 20, let superPotion, items[superPotion]! > 0 {
            bestItem = superPotion
        } else if let potion, items[potion]! > 0 {
            bestItem = potion
        } else {
            return nil
        }

        if let item = bestItem {
            let heal = trainer.getBag().useItem(item: item)
            pokemon.changeHealth(amount: heal!)
            return item
        }

        return nil
    }
        
    static func changePokemon(team: [Pokemon], activePokemon: Pokemon) -> Pokemon? {
        let weakness = activePokemon.getWeakness()
        var bestPokemon: Pokemon?
        var bestResistance: Double = Double.greatestFiniteMagnitude
        
        for pokemon in team {
            guard pokemon.getIsAlive() else { continue }
            guard pokemon.getName() != activePokemon.getName() else { continue }
            
            let pokemonTypes = pokemon.getType()
            var totalMultiplier: Double = 1
            
            for type in pokemonTypes {
                totalMultiplier *= weakness[type] ?? 1.0
            }
            
            if totalMultiplier < bestResistance {
                bestResistance = totalMultiplier
                bestPokemon = pokemon
            }
        }
        
        return bestPokemon
    }
    
    private static func chooseMove(userPokemon: Pokemon, pcPokemon: Pokemon) -> Move {
        let weakness = userPokemon.getWeakness()
        var bestMove: Move = pcPokemon.getMoves()[0]
        var bestDamage = 0.0
        
        for move in pcPokemon.getMoves() {
            guard move.getPp() > 0 else { continue }
            let type = move.getType()
            let power = move.getPower()
            let multiplier = weakness[type] ?? 1.0
            
            let damageScore = Double(power) * multiplier

            if damageScore > bestDamage {
                bestDamage = damageScore
                bestMove = move
            }
        }
        
        return bestMove
    }
    
    private static func shouldHeal(trainer: Trainer, userPokemon: Pokemon, pcPokemon: Pokemon) -> Bool {
        let enemyTypes = userPokemon.getType()
        let pcWeakness = pcPokemon.getWeakness()
        let pcHP = pcPokemon.getCurrentHealth()

        let totalAlive = trainer.getTeam().filter { $0.getIsAlive() }.count
        
        if totalAlive == 1 && userPokemon.getCurrentHealth() < userPokemon.getHealth() / 2 { return true }
        if totalAlive == 1 && pcHP <= pcPokemon.getHealth() / 2 { return true }
        
        for type in enemyTypes {
            if let multiplier = pcWeakness[type], multiplier >= 2.0 { return false }
        }
        
        if pcHP <= pcPokemon.getHealth() / 4 { return true }
        
        return false
    }
    
    private static func shouldSwitch(trainer: Trainer, userPokemon: Pokemon, pcPokemon: Pokemon) -> Bool {
        let pcHP = pcPokemon.getCurrentHealth()
        let team = trainer.getTeam()
        
        let random = Int.random(in: 1...100)
        if userAction == 2 && random > 50 {
            let types = userPokemon.getType()
            
            for pokemon in team where pokemon.getIsAlive() {
                let weakness = pokemon.getWeakness()
                var totalMultiplier: Double = 1.0
                
                for type in types {
                    if let multiplier = weakness[type] {
                        totalMultiplier *= multiplier
                    }
                }

                if totalMultiplier < 1.0 {
                    return true
                }
            }
        }
        
        if let userUsedMove {
            let probableDamage = MoveManager.calculateDamage(from: userPokemon, with: userUsedMove, to: pcPokemon)
            
            if probableDamage >= pcHP {
                for pokemon in team {
                    guard pokemon.getIsAlive() else { continue }
                    let damage = MoveManager.calculateDamage(from: userPokemon, with: userUsedMove, to: pokemon)
                    if damage <= pokemon.getCurrentHealth() * 3 / 10 { return true }
                }
            }
        }
        
        return false
    }
}
