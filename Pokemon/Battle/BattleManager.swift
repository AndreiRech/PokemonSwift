class BattleManager {
    static func battle(trainer1: Trainer, trainer2: Trainer) {
        let pkm1 = trainer1.getActivePokemon()
        let pkm2 = trainer2.getActivePokemon()
        
        var valid = false
        while !valid {
            battleUi.printBattle(pkm1: pkm1, pkm2: pkm2)
            Menu.menu(pokemon: pkm1)
            
            updateMusicForHealth(pokemon: pkm1)
            
            let input = readLine() ?? "0"
            switch input {
            case "1":
                PlayerActions.fightChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1)
                valid = true
            case "2":
                valid = PlayerActions.bagChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1)
            case "3":
                valid = PlayerActions.pokemonChoice(pkm1: pkm1, pkm2: pkm2, trainer: trainer1)
            case "4":
                PlayerActions.runChoice(pkm1: pkm1, pkm2: pkm2)
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
