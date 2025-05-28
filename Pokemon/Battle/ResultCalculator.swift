import Foundation

class ResultCalculator {
    static func calculateResults(trainer1: Trainer, trainer2: Trainer) {
        // Trainer 1
        let team1 = trainer1.getTeam()
        let currentPokemon1 = trainer1.getActivePokemon()
        
        // Trainer 2
        let team2 = trainer2.getTeam()
        let currentPokemon2 = trainer2.getActivePokemon()
        
        // ------------- //
        
        if currentPokemon1.getStatus().getSpeed() >= currentPokemon2.getStatus().getSpeed() {
            // Turno User
            if let userUsedMove = userUsedMove {
                battleEffect(attacker: currentPokemon1, target: currentPokemon2, move: userUsedMove, team: team2, enemy: trainer2)
                
                if victory != nil {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU WON!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.win)
                    sleep(10)
                    return
                }
                
                if let pcNewPokemonLet = pcNewPokemon {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                    trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                    pcNewPokemon = nil
                    return
                }
            }
            
            if let userNewPokemonLet = userNewPokemon {
                battleUi.printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
                trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
            }
            
            // Turno PC
            if let pcUsedMove = pcUsedMove {
                battleEffect(attacker: currentPokemon2, target: currentPokemon1, move: pcUsedMove, team: team1, enemy: trainer1)
                
                if victory != nil {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU LOST!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.lose)
                    sleep(10)
                    return
                }
                
                if let userNewPokemonLet = userNewPokemon {
                    battleUi.printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOUR \(currentPokemon1.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                    trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                    userNewPokemon = nil
                    return
                }
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                battleUi.printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
        } else {
            // Turno PC
            if let pcUsedMove = pcUsedMove {
                battleEffect(attacker: currentPokemon2, target: currentPokemon1, move: pcUsedMove, team: team1, enemy: trainer1)
                
                if victory != nil {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU LOST!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.lose)
                    sleep(10)
                    return
                }
                
                if let userNewPokemonLet = userNewPokemon {
                    battleUi.printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOUR \(currentPokemon1.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                    trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                    userNewPokemon = nil
                    return
                }
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                battleUi.printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
            
            // Turno User
            if let userUsedMove = userUsedMove {
                battleEffect(attacker: currentPokemon1, target: currentPokemon2, move: userUsedMove, team: team2, enemy: trainer2)
                
                if victory != nil {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: currentPokemon2, text: "YOU WON!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.win)
                    sleep(10)
                    return
                }
                
                if let pcNewPokemonLet = pcNewPokemon {
                    battleUi.printBoard(pkm1: currentPokemon1, pkm2: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                    trainer2.setActivePokemon(pokemon: pcNewPokemonLet)
                    pcNewPokemon = nil
                    return
                }
            }
            
            if let userNewPokemonLet = userNewPokemon {
                battleUi.printBoard(pkm1: userNewPokemonLet, pkm2: currentPokemon2, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
                trainer1.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
            }
        }
    }

    private static func battleEffect(attacker: Pokemon, target: Pokemon, move: Move, team: [Pokemon], enemy: Trainer) {
        let result = MoveManager.useMove(attacker: attacker, usedMove: move, target: target)
        var pkm1: Pokemon
        var pkm2: Pokemon
        
        if enemy.id == 1 {
            pkm1 = target
            pkm2 = attacker
        } else {
            pkm1 = attacker
            pkm2 = target
        }
        
        switch result {
        case .Immune:
            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(target.getName()) is immune to \(move.getName())")
        case .Miss:
            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(attacker.getName()) missed \(move.getName())")
        case .Hit:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(attacker.getName()) hit \(move.getName())")
        case .SuperEffective:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(move.getName()) is super effective!")
        case .NotVeryEffective:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "\(move.getName()) is not very effective...")
        default :
            fatalError()
        }
        
        if !target.getIsAlive() {
            if enemy.id == 2 {
                pcNewPokemon = PcActions.changePokemon(team: team, activePokemon: enemy.getActivePokemon())
                if pcNewPokemon != nil {
                    Music.musicPlayerHelper.play(song: Music.out)
                    return
                }
                victory = enemy
            } else {
                var count = 0
                for pokemon in team {
                    if !pokemon.getIsAlive() {
                        count += 1
                    }
                }
                
                if count == enemy.getTeam().count {
                    victory = enemy
                } else {
                    repeat {
                        if PlayerActions.pokemonChoice(pkm1: target, pkm2: attacker, trainer: enemy) {
                            userNewPokemon = enemy.getActivePokemon()
                            return
                        }
                        
                        if userNewPokemon == nil {
                            battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "Select a valid pokemon!")
                        }
                    } while userNewPokemon == nil
                    
                }
            }
        }
    }

}
