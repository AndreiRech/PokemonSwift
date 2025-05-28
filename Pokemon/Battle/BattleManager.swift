class BattleManager {
    static func battle(user: Trainer, pc: Trainer) {
        let userPokemon = user.getActivePokemon()
        let pcPokemon = pc.getActivePokemon()
        
        var valid = false
        while !valid {
            battleUi.printBattle(pokemonB: userPokemon, pokemonF: pcPokemon)
            Menu.menu(pokemon: userPokemon)
            
            updateMusicForHealth(pokemon: userPokemon)
            
            let input = readLine() ?? "0"
            switch input {
            case "1":
                valid = PlayerActions.fightChoice(userPokemon: userPokemon, pcPokemon: pcPokemon, trainer: user)
            case "2":
                valid = PlayerActions.bagChoice(userPokemon: userPokemon, pcPokemon: pcPokemon, trainer: user)
            case "3":
                valid = PlayerActions.pokemonChoice(userPokemon: userPokemon, pcPokemon: pcPokemon, trainer: user)
            case "4":
                PlayerActions.runChoice(userPokemon: userPokemon, pcPokemon: pcPokemon)
            default:
                print("Invalid input")
            }
        }
    }
    
    private static func updateMusicForHealth(pokemon: Pokemon) {
        if pokemon.getCurrentHealth() <= pokemon.getHealth() / 4 {
            if !Music.musicPlayerLow.isCurrentlyPlaying() {
                Music.musicPlayer.pause()
                Music.musicPlayerLow.play(song: Music.criticalHealth)
            }
        } else if pokemon.getCurrentHealth() > pokemon.getHealth() / 4 {
            if Music.musicPlayerLow.isCurrentlyPlaying() {
                Music.musicPlayerLow.pause()
                Music.musicPlayer.resume()
            }
        }
    }    
}
