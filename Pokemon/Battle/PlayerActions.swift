class PlayerActions {
    static func fightChoice(userPokemon: Pokemon, pcPokemon: Pokemon, trainer: Trainer) -> Bool {
        while true {
            battleUi.printBattle(pokemonB: userPokemon, pokemonF: pcPokemon)
            Menu.fightMenu(pokemon: trainer.getActivePokemon())

            let input = readLine() ?? "0"
            if let i = Int(input), i >= 1 && i <= 4 {
                let move = userPokemon.getMoves()[i - 1]
                if move.getPp() > 0 {
                    userUsedMove = move
                    userAction = 0
                    return true
                } else {
                    battleUi.printBoard(pokemonB: userPokemon, pokemonF: pcPokemon, text: "You have no PP left for this move!")
                }
            } else {
                return false
            }
        }
    }

    static func bagChoice(userPokemon: Pokemon, pcPokemon: Pokemon, trainer: Trainer) -> Bool {
        let bag = trainer.getBag()
        while true {
            battleUi.printBattle(pokemonB: userPokemon, pokemonF: pcPokemon)
            Menu.bagMenu(bag: bag)

            let input = readLine() ?? "0"
            switch input {
            case "1", "2", "3":
                let index = Int(input)! - 1
                let itemKey = Array(bag.getItems().keys)[index]
                if bag.getItems()[itemKey]! > 0 {
                    let heal = bag.useItem(item: itemKey)!
                    trainer.getActivePokemon().changeHealth(amount: heal)
                    Music.musicPlayerHelper.play(song: Music.healM)
                    battleUi.printBoard(pokemonB: userPokemon, pokemonF: pcPokemon, text: "You used \(itemKey.getName())!")
                    userAction = 1
                    return true
                }
            case "4":
                userAction = -1
                return false
            default:
                print("Invalid input")
            }
        }
    }

    static func pokemonChoice(userPokemon: Pokemon, pcPokemon: Pokemon, trainer: Trainer) -> Bool {
        while true {
            battleUi.printBattle(pokemonB: userPokemon, pokemonF: pcPokemon)
            Menu.pokemonMenu(trainer: trainer)

            let input = readLine() ?? "0"
            switch input {
            case "1", "2", "3":
                let i = Int(input)! - 1
                let pokemon = trainer.getTeam()[i]
                if pokemon.getIsAlive(), pokemon.getName() != trainer.getActivePokemon().getName() {
                    trainer.setActivePokemon(index: i)
                    Music.musicPlayerHelper.play(song: Music.out)
                    battleUi.printBoard(pokemonB: userPokemon, pokemonF: pcPokemon, text: "You sent out \(pokemon.getName())!")
                    userAction = 2
                    return true
                }
            case "4":
                userAction = -1
                return false
            default:
                print("Invalid input")
            }
        }
    }

    static func runChoice(userPokemon: Pokemon, pcPokemon: Pokemon) {
        while true {
            battleUi.printBattle(pokemonB: userPokemon, pokemonF: pcPokemon)
            Menu.runMenu()

            if readLine() == "1" { return }
            print("Invalid input")
        }
    }
}
