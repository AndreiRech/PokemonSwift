class Menu {
    static func buildTeam(trainer: Trainer, pc: Pc) {
        if trainer.id == 1 {
            print("\n-------------------- [ SELECT YOUR POKEMON ] --------------------")
        } else {
            print("-------------------- [ SELECT YOUR ENEMY'S POKEMON ] --------------------")
        }
        
        var i = 0
        for p in pc.getPokemons() {
            i += 1
            print("\(i). \(p.getName())")
        }

        print("------------------------------------------------------------------")

        var choosing = true
        var team: [Pokemon] = []
        let maxTeamSize = 3

        repeat {
            print("\nSelect your Pokemon (1 to \(i) or type 0 to finish): ")
            
            guard let input = readLine(), let choice = Int(input), choice >= 0 else {
                print("Invalid input. Try again.")
                continue
            }
            
            if choice == 0 {
                if team.count == maxTeamSize {
                    print("You have finished selecting Pokémon.")
                    choosing = false
                } else {
                    print("You need to select \(maxTeamSize) Pokémon.")
                }
            } else if choice >= 1 && choice <= i {
                if team.count < maxTeamSize && team.contains(where: { $0.getName() == pc.getPokemons()[choice - 1].getName() }) == false {
                    let pkm = pc.getPokemons()[choice - 1]
                    team.append(pkm)
                    print("You selected \(pkm.getName())")
                    print(pkm.getSprite()[1])
                } else {
                    print("You can't select more than \(maxTeamSize) Pokémon nor pick the same twice.")
                }
            } else {
                print("Invalid option. Try again.")
            }
            
            if team.count == maxTeamSize {
                print("You have finished selecting Pokémon.")
                choosing = false
            }
        } while choosing
        
        trainer.createTeam(pokemon: team)
    }

    static func menu(pokemon: Pokemon) {
        let pokemonName = pokemon.getName().uppercased()
        let text = Auxiliars.countSpaces(name: "WHAT WILL \(pokemonName) DO?", size: 64)
        
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |                                                                |          1. FIGHT             |           2. BAG              |
                                                    |\(text)|-------------------------------|-------------------------------|  
                                                    |                                                                |          3. POKEMON           |           4. RUN              |
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }

    static func fightMenu(pokemon: Pokemon) {
        var attacks: [String] = []
        
        var i = 0
        for attack in pokemon.getMoves() {
            i += 1
            attacks.append(Auxiliars.countSpaces(name: "\(i). \(attack.getName()) x \(attack.getPp())", size: 64))
        }
        
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |\(attacks[0])|\(attacks[1])|
                                                    |----------------------------------------------------------------|----------------------------------------------------------------|  
                                                    |\(attacks[2])|\(attacks[3])|
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }

    static func bagMenu(bag: Bag) {
        var items: [String] = []
        
        var i = 0
        for item in bag.getItems() {
            i += 1
            items.append(Auxiliars.countSpaces(name: "\(i). \(item.key.getName()) x \(item.value)", size: 64))
        }
        let back = Auxiliars.countSpaces(name: "4. Return", size: 64)
        
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |\(items[0])|\(items[1])|
                                                    |----------------------------------------------------------------|----------------------------------------------------------------|  
                                                    |\(items[2])|\(back)|
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }

    static func pokemonMenu(trainer: Trainer) {
        var pokemons: [String] = []
        
        var i = 0
        for pokemon in trainer.getTeam() {
            i += 1
            if !pokemon.getIsAlive() {
                pokemons.append(Auxiliars.countSpaces(name: "\(i). \(pokemon.getName()) ❌", size: 63))
            } else {
                pokemons.append(Auxiliars.countSpaces(name: "\(i). \(pokemon.getName())", size: 64))
            }
        }
        let back = Auxiliars.countSpaces(name: "4. Return", size: 64)
        
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |\(pokemons[0])|\(pokemons[1])|
                                                    |----------------------------------------------------------------|----------------------------------------------------------------|  
                                                    |\(pokemons[2])|\(back)|
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }

    static func runMenu() {
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |                                              YOU CAN'T RUN FROM A TRAINER BATTLE                                               |
                                                    |----------------------------------------------------------------|---------------------------------------------------------------|  
                                                    |                                                            1. OKAY                                                             |
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }

    static func runningMenu(text: String) {
        let menuText = Auxiliars.countSpaces(name: text.uppercased(), size: 128)
        
        let menu = """
                                                    ═══════════════════════════════════════════════════════════════ஜ۩۞۩ஜ══════════════════════════════════════════════════════════════
                                                    |                                                                                                                                |
                                                    |\(menuText)|  
                                                    |                                                                                                                                |
                                                    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
        """
        
        print(menu)
    }
}
