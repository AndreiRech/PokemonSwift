import Foundation

class ResultCalculator {
    static func calculateResults(user: Trainer, pc: Trainer) {
        // Trainer 1
        let userTeam = user.getTeam()
        let userCurrentPokemon = user.getActivePokemon()
        
        // Trainer 2
        let pcTeam = pc.getTeam()
        let pcCurrentPokemon = pc.getActivePokemon()
        
        // ------------- //
        if userCurrentPokemon.getStatus().getSpeed() >= pcCurrentPokemon.getStatus().getSpeed() {
            // Turno User
            if let userUsedMove = userUsedMove {
                battleEffect(attacker: userCurrentPokemon, target: pcCurrentPokemon, move: userUsedMove, team: pcTeam, enemy: pc)
                
                if victory != nil {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcCurrentPokemon, text: "YOU WON!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.win)
                    sleep(10)
                    return
                }
                
                if let pcNewPokemonLet = pcNewPokemon {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                    pc.setActivePokemon(pokemon: pcNewPokemonLet)
                    pcNewPokemon = nil
                    return
                }
            }
            
            if let userNewPokemonLet = userNewPokemon {
                battleUi.printBoard(pokemonB: userNewPokemonLet, pokemonF: pcCurrentPokemon, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
                user.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
            }
            
            // Turno PC
            if let pcUsedMove = pcUsedMove {
                battleEffect(attacker: pcCurrentPokemon, target: userCurrentPokemon, move: pcUsedMove, team: userTeam, enemy: user)
                
                if victory != nil {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcCurrentPokemon, text: "YOU LOST!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.lose)
                    sleep(10)
                    return
                }
                
                if let userNewPokemonLet = userNewPokemon {
                    battleUi.printBoard(pokemonB: userNewPokemonLet, pokemonF: pcCurrentPokemon, text: "YOUR \(userCurrentPokemon.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                    user.setActivePokemon(pokemon: userNewPokemonLet)
                    userNewPokemon = nil
                    return
                }
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                pc.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
        } else {
            // Turno PC
            if let pcUsedMove = pcUsedMove {
                battleEffect(attacker: pcCurrentPokemon, target: userCurrentPokemon, move: pcUsedMove, team: userTeam, enemy: user)
                
                if victory != nil {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcCurrentPokemon, text: "YOU LOST!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.lose)
                    sleep(10)
                    return
                }
                
                if let userNewPokemonLet = userNewPokemon {
                    battleUi.printBoard(pokemonB: userNewPokemonLet, pokemonF: pcCurrentPokemon, text: "YOUR \(userCurrentPokemon.getName()) DIED. YOU SENT OUT \(userNewPokemonLet.getName())!")
                    user.setActivePokemon(pokemon: userNewPokemonLet)
                    userNewPokemon = nil
                    return
                }
            }
            
            if let pcNewPokemonLet = pcNewPokemon {
                battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                pc.setActivePokemon(pokemon: pcNewPokemonLet)
                pcNewPokemon = nil
                return
            }
            
            // Turno User
            if let userUsedMove = userUsedMove {
                battleEffect(attacker: userCurrentPokemon, target: pcCurrentPokemon, move: userUsedMove, team: pcTeam, enemy: pc)
                
                if victory != nil {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcCurrentPokemon, text: "YOU WON!")
                    Music.musicPlayerLow.pause()
                    Music.musicPlayer.changeSong(to: Music.win)
                    sleep(10)
                    return
                }
                
                if let pcNewPokemonLet = pcNewPokemon {
                    battleUi.printBoard(pokemonB: userCurrentPokemon, pokemonF: pcNewPokemonLet, text: "YOUR OPPONENT SENT OUT \(pcNewPokemonLet.getName())!")
                    pc.setActivePokemon(pokemon: pcNewPokemonLet)
                    pcNewPokemon = nil
                    return
                }
            }
            
            if let userNewPokemonLet = userNewPokemon {
                battleUi.printBoard(pokemonB: userNewPokemonLet, pokemonF: pcCurrentPokemon, text: "YOU SENT OUT \(userNewPokemonLet.getName())!")
                user.setActivePokemon(pokemon: userNewPokemonLet)
                userNewPokemon = nil
            }
        }
    }

    private static func battleEffect(attacker: Pokemon, target: Pokemon, move: Move, team: [Pokemon], enemy: Trainer) {
        let result = MoveManager.useMove(attacker: attacker, usedMove: move, target: target)
        var pokemonB: Pokemon
        var pokemonF: Pokemon
        
        if enemy.id == 1 {
            pokemonB = target
            pokemonF = attacker
        } else {
            pokemonB = attacker
            pokemonF = target
        }
        
        switch result {
        case .Immune:
            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "\(target.getName()) is immune to \(move.getName())")
        case .Miss:
            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "\(attacker.getName()) missed \(move.getName())")
        case .Hit:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "\(attacker.getName()) hit \(move.getName())")
        case .SuperEffective:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "\(move.getName()) is super effective!")
        case .NotVeryEffective:
            Music.musicPlayerHelper.play(song: Music.hit)
            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "\(move.getName()) is not very effective...")
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
                        if PlayerActions.pokemonChoice(userPokemon: target, pcPokemon: attacker, trainer: enemy) {
                            userNewPokemon = enemy.getActivePokemon()
                            return
                        }
                        
                        if userNewPokemon == nil {
                            battleUi.printBoard(pokemonB: pokemonB, pokemonF: pokemonF, text: "Select a valid pokemon!")
                        }
                    } while userNewPokemon == nil
                    
                }
            }
        }
    }

}
