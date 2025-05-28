class PcActions {
    static func turn(trainer1: Trainer, trainer2: Trainer) {
        let enemy = trainer1.getActivePokemon()
        let pc = trainer2.getActivePokemon()
        
        let bestMove = chooseMove(enemy: enemy, pc: pc)
        
        print("Best move: \(bestMove.getName())")
        
        let probableDamage = MoveManager.calculateDamage(from: pc, with: bestMove, to: enemy)
        let seeKill = probableDamage >= enemy.getCurrentHealth()
        
        print("See kill: \(seeKill)")
        
        if seeKill {
            pcUsedMove = bestMove
            return
        }
        
        if shouldHeal(trainer: trainer2, enemy: enemy, pc: pc) {
            print("Should heal")
            if let item =  heal(trainer: trainer2, pokemon: pc) {
                print("Healed with \(item.getName())")
                pcUsedMove = nil
                Music.musicPlayerHelper.play(song: Music.healM)
                battleUi.printBoard(pkm1: enemy, pkm2: pc, text: "Your opponent used \(item.getName())!")
                return
            }
        }
        
        if shouldSwitch(trainer: trainer2, enemy: enemy, pc: pc) {
            print("Should switch")
            if let new = changePokemon(team: trainer2.getTeam(), activePokemon: pc) {
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
    
    private static func chooseMove(enemy: Pokemon, pc: Pokemon) -> Move {
        let weakness = enemy.getWeakness()
        var bestMove: Move = pc.getMoves()[0]
        var bestDamage = 0.0
        
        for move in pc.getMoves() {
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
    
    private static func shouldHeal(trainer: Trainer, enemy: Pokemon, pc: Pokemon) -> Bool {
        let enemyTypes = enemy.getType()
        let pcWeakness = pc.getWeakness()
        let pcHP = pc.getCurrentHealth()

        let totalAlive = trainer.getTeam().filter { $0.getIsAlive() }.count
        print("totalAlive: \(totalAlive)")
        if totalAlive == 1 && enemy.getCurrentHealth() < enemy.getHealth() / 2 { return true }
        if totalAlive == 1 && pcHP <= pc.getHealth() / 2 { return true }
        
        for type in enemyTypes {
            if let multiplier = pcWeakness[type], multiplier >= 2.0 { return false }
        }
        
        print("pcHP <= pc.getHealth() / 4: \(pcHP <= pc.getHealth() / 4)")
        if pcHP <= pc.getHealth() / 4 { return true }
        
        return false
    }
    
    private static func shouldSwitch(trainer: Trainer, enemy: Pokemon, pc: Pokemon) -> Bool {
        let pcHP = pc.getCurrentHealth()
        let team = trainer.getTeam()
        
        let random = Int.random(in: 1...100)
        print("random: \(random)")
        if userAction == 2 && random > 50 {
            print("> 50")
            
            let types = enemy.getType()
            
            for pokemon in team where pokemon.getIsAlive() {
                let weakness = pokemon.getWeakness()
                var totalMultiplier: Double = 1.0
                
                for type in types {
                    if let multiplier = weakness[type] {
                        totalMultiplier *= multiplier
                    }
                }

                print("pokemon name: \(pokemon.getName())")
                print("total multiplier: \(totalMultiplier)")
                if totalMultiplier < 1.0 {
                    return true
                }
            }
        }
        
        if let userUsedMove {
            let probableDamage = MoveManager.calculateDamage(from: enemy, with: userUsedMove, to: pc)
            
            if probableDamage >= pcHP {
                for pokemon in team {
                    guard pokemon.getIsAlive() else { continue }
                    let damage = MoveManager.calculateDamage(from: enemy, with: userUsedMove, to: pokemon)
                    if damage <= pokemon.getCurrentHealth() * 3 / 10 { return true }
                }
            }
        }
        
        return false
    }
}
