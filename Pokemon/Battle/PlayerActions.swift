class PlayerActions {
    static func fightChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) {
        var valid = false
        while !valid {
            battleUi.printBattle(pkm1: pkm1, pkm2: pkm2)
            Menu.fightMenu(pokemon: trainer.getActivePokemon())

            let input = readLine() ?? "0"
            if let i = Int(input), i >= 1 && i <= 4 {
                let move = pkm1.getMoves()[i - 1]
                if move.getPp() > 0 {
                    userUsedMove = move
                    userAction = 0
                    valid = true
                } else {
                    battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "You have no PP left for this move!")
                }
            } else {
                print("Invalid input")
            }
        }
    }

    static func bagChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) -> Bool {
        let bag = trainer.getBag()
        while true {
            battleUi.printBattle(pkm1: pkm1, pkm2: pkm2)
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
                    battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "You used \(itemKey.getName())!")
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

    static func pokemonChoice(pkm1: Pokemon, pkm2: Pokemon, trainer: Trainer) -> Bool {
        while true {
            battleUi.printBattle(pkm1: pkm1, pkm2: pkm2)
            Menu.pokemonMenu(trainer: trainer)

            let input = readLine() ?? "0"
            switch input {
            case "1", "2", "3":
                let i = Int(input)! - 1
                let pokemon = trainer.getTeam()[i]
                if pokemon.getIsAlive(), pokemon.getName() != trainer.getActivePokemon().getName() {
                    trainer.setActivePokemon(index: i)
                    Music.musicPlayerHelper.play(song: Music.out)
                    battleUi.printBoard(pkm1: pkm1, pkm2: pkm2, text: "You sent out \(pokemon.getName())!")
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

    static func runChoice(pkm1: Pokemon, pkm2: Pokemon) {
        while true {
            battleUi.printBattle(pkm1: pkm1, pkm2: pkm2)
            Menu.runMenu()

            if readLine() == "1" { return }
            print("Invalid input")
        }
    }
}
