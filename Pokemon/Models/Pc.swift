class Pc {
    private var pokemons: [Pokemon] = []
    
    private var moves: [String: Move] = [:]
    
    init() {
        self.moves = createMoves()
        self.pokemons = createPokemon()
    }
    
    func createMoves() -> [String: Move] {
        var moves: [String: Move] = [:]
        
        moves["Thunder"] = Move(name: "Thunder", type: Types.Electric, power: 110, pp: 10, accuracy: 70, moveType: .special)
        moves["Thunderbolt"] = Move(name: "Thunderbolt", type: Types.Electric, power: 90, pp: 15, accuracy: 100, moveType: .special)
        moves["Thunder Shock"] = Move(name: "Thunder Shock", type: Types.Electric, power: 40, pp: 30, accuracy: 100, moveType: .special)
        
        moves["Fire Blast"] = Move(name: "Fire Blast", type: Types.Fire, power: 110, pp: 5, accuracy: 85, moveType: .special)
        moves["Flamethrower"] = Move(name: "Flamethrower", type: Types.Fire, power: 90, pp: 15, accuracy: 100, moveType: .special)
        moves["Ember"] = Move(name: "Ember", type: Types.Fire, power: 40, pp: 25, accuracy: 100, moveType: .special)
        
        moves["Hydro Pump"] = Move(name: "Hydro Pump", type: Types.Water, power: 110, pp: 5, accuracy: 80, moveType: .special)
        moves["Surf"] = Move(name: "Surf", type: Types.Water, power: 90, pp: 15, accuracy: 100, moveType: .special)
        moves["Bubble Beam"] = Move(name: "Bubble Beam", type: Types.Water, power: 65, pp: 20, accuracy: 100, moveType: .special)
        
        moves["Blizzard"] = Move(name: "Blizzard", type: Types.Ice, power: 110, pp: 5, accuracy: 70, moveType: .special)
        moves["Ice Beam"] = Move(name: "Ice Beam", type: Types.Ice, power: 90, pp: 10, accuracy: 100, moveType: .special)
        moves["Icy Wind"] = Move(name: "Icy Wind", type: Types.Ice, power: 55, pp: 15, accuracy: 95, moveType: .special)
        
        moves["Psystrike"] = Move(name: "Psystrike", type: Types.Psychic, power: 100, pp: 10, accuracy: 100, moveType: .special)
        moves["Psychic"] = Move(name: "Psychic", type: Types.Psychic, power: 90, pp: 10, accuracy: 100, moveType: .special)
        moves["Confusion"] = Move(name: "Confusion", type: Types.Psychic, power: 50, pp: 25, accuracy: 100, moveType: .special)
        
        moves["Poltergeist"] = Move(name: "Poltergeist", type: Types.Ghost, power: 110, pp: 5, accuracy: 90, moveType: .physical)
        moves["Shadow Ball"] = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 15, accuracy: 100, moveType: .special)
        moves["Astonish"] = Move(name: "Astonish", type: Types.Ghost, power: 30, pp: 15, accuracy: 100, moveType: .physical)
        
        moves["Earthquake"] = Move(name: "Earthquake", type: Types.Ground, power: 100, pp: 10, accuracy: 100, moveType: .physical)
        moves["Earth Power"] = Move(name: "Earth Power", type: Types.Ground, power: 90, pp: 10, accuracy: 100, moveType: .special)
        moves["Mud Slap"] = Move(name: "Mud Slap", type: Types.Ground, power: 20, pp: 10, accuracy: 100, moveType: .special)
        
        moves["Wood Hammer"] = Move(name: "Wood Hammer", type: Types.Grass, power: 120, pp: 15, accuracy: 100, moveType: .physical)
        moves["Leaf Blade"] = Move(name: "Leaf Blade", type: Types.Grass, power: 90, pp: 15, accuracy: 100, moveType: .physical)
        moves["Vine Whip"] = Move(name: "Vine Whip", type: Types.Grass, power: 45, pp: 25, accuracy: 100, moveType: .physical)
        
        moves["Diamond Storm"] = Move(name: "Diamond Storm", type: Types.Rock, power: 100, pp: 5, accuracy: 95, moveType: .physical)
        moves["Rock Tomb"] = Move(name: "Rock Tomb", type: Types.Rock, power: 60, pp: 15, accuracy: 95, moveType: .physical)
        moves["Smack Down"] = Move(name: "Smack Down", type: Types.Rock, power: 50, pp: 15, accuracy: 100, moveType: .physical)
        
        moves["Super Power"] = Move(name: "Super Power", type: Types.Fighting, power: 120, pp: 5, accuracy: 100, moveType: .physical)
        moves["Body Press"] = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 100, moveType: .physical)
        moves["Force Palm"] = Move(name: "Force Palm", type: Types.Fighting, power: 60, pp: 10, accuracy: 100, moveType: .physical)
        
        moves["Mega Kick"] = Move(name: "Mega Kick", type: Types.Normal, power: 120, pp: 5, accuracy: 75, moveType: .physical)
        moves["Body Slam"] = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        moves["Tackle"] = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 35, accuracy: 100, moveType: .physical)
        
        moves["Outrage"] = Move(name: "Outrage", type: Types.Dragon, power: 120, pp: 10, accuracy: 100, moveType: .physical)
        moves["Dragon Pulse"] = Move(name: "Dragon Pulse", type: Types.Dragon, power: 85, pp: 10, accuracy: 100, moveType: .special)
        moves["Breaking Swipe"] = Move(name: "Breaking Swipe", type: Types.Dragon, power: 60, pp: 15, accuracy: 100, moveType: .physical)
        
        moves["First Impression"] = Move(name: "First Impression", type: Types.Normal, power: 90, pp: 10, accuracy: 100, moveType: .physical)
        moves["X Scissor"] = Move(name: "X Scissor", type: Types.Bug, power: 80, pp: 15, accuracy: 100, moveType: .physical)
        moves["Bug Bite"] = Move(name: "Bug Bite", type: Types.Bug, power: 60, pp: 20, accuracy: 100, moveType: .physical)
        
        moves["Brave Bird"] = Move(name: "Brave Bird", type: Types.Flying, power: 120, pp: 10, accuracy: 100, moveType: .physical)
        moves["Wing Attack"] = Move(name: "Wing Attack", type: Types.Flying, power: 60, pp: 35, accuracy: 100, moveType: .physical)
        moves["Gust"] = Move(name: "Gust", type: Types.Flying, power: 40, pp: 35, accuracy: 100, moveType: .special)
        
        moves["Gunk Shot"] = Move(name: "Gunk Shot", type: Types.Poison, power: 120, pp: 5, accuracy: 80, moveType: .physical)
        moves["Sludge Wave"] = Move(name: "Sludge Wave", type: Types.Poison, power: 95, pp: 10, accuracy: 100, moveType: .special)
        moves["Acid"] = Move(name: "Acid", type: Types.Poison, power: 40, pp: 30, accuracy: 100, moveType: .special)
        
        return moves
    }
    
    func createPokemon() -> [Pokemon] {
        var pokemons: [Pokemon] = []
        
        var move1 = Move(name: "Fire Blast", type: Types.Fire, power: 110, pp: 5, accuracy: 85, moveType: .special)
        var move2 = Move(name: "Flamethrower", type: Types.Fire, power: 90, pp: 15, accuracy: 100, moveType: .special)
        var move3 = Move(name: "Wing Attack", type: Types.Flying, power: 60, pp: 35, accuracy: 100, moveType: .physical)
        var move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 35, accuracy: 100, moveType: .physical)
        var status = Status(hp: 78, attack: 84, defense: 78, specialAttack: 109, specialDefense: 85, speed: 100)
        pokemons.append(Pokemon(name: "Charizard", type: [Types.Fire, Types.Flying], moves: [move1, move2, move3, move4], status: status, sprites: [charizardB, charizardF], nature: Nature.Timid))
        
        move1 = Move(name: "Wood Hammer", type: Types.Grass, power: 120, pp: 15, accuracy: 100, moveType: .physical)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 95, pp: 10, accuracy: 100, moveType: .special)
        move3 = Move(name: "Vine Whip", type: Types.Grass, power: 45, pp: 25, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Bug Bite", type: Types.Bug, power: 60, pp: 20, accuracy: 100, moveType: .physical)
        status = Status(hp: 80, attack: 82, defense: 83, specialAttack: 100, specialDefense: 100, speed: 80)
        pokemons.append(Pokemon(name: "Venusaur", type: [Types.Grass, Types.Poison], moves: [move1, move2, move3, move4], status: status, sprites: [venusaurB, venusaurF], nature: Nature.Timid))
        
        move1 = Move(name: "Hydro Pump", type: Types.Water, power: 110, pp: 5, accuracy: 80, moveType: .special)
        move2 = Move(name: "Surf", type: Types.Water, power: 90, pp: 15, accuracy: 100, moveType: .special)
        move3 = Move(name: "Icy Wind", type: Types.Ice, power: 55, pp: 15, accuracy: 95, moveType: .special)
        move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 35, accuracy: 100, moveType: .physical)
        status = Status(hp: 79, attack: 83, defense: 100, specialAttack: 85, specialDefense: 105, speed: 78)
        pokemons.append(Pokemon(name: "Blastoise", type: [Types.Water], moves: [move1, move2, move3, move4], status: status, sprites: [blastoiseB, blastoiseF], nature: Nature.Modest))
        
        move1 = Move(name: "Thunder", type: Types.Electric, power: 110, pp: 10, accuracy: 70, moveType: .special)
        move2 = Move(name: "Thunderbolt", type: Types.Electric, power: 90, pp: 15, accuracy: 100, moveType: .special)
        move3 = Move(name: "Thunder Shock", type: Types.Electric, power: 40, pp: 30, accuracy: 100, moveType: .special)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 35, attack: 55, defense: 40, specialAttack: 50, specialDefense: 50, speed: 90)
        pokemons.append(Pokemon(name: "Pikachu", type: [Types.Electric], moves: [move1, move2, move3, move4], status: status, sprites: [pikachuB, pikachuF], nature: Nature.Modest))
        
        move1 = Move(name: "Brave Bird", type: Types.Flying, power: 120, pp: 10, accuracy: 100, moveType: .physical)
        move2 = Move(name: "Gust", type: Types.Flying, power: 40, pp: 35, accuracy: 100, moveType: .special)
        move3 = Move(name: "Astonish", type: Types.Ghost, power: 30, pp: 15, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 83, attack: 80, defense: 75, specialAttack: 70, specialDefense: 70, speed: 101)
        pokemons.append(Pokemon(name: "Pidgeot", type: [Types.Flying, Types.Normal], moves: [move1, move2, move3, move4], status: status, sprites: [pidgeotB, pidgeotF], nature: Nature.Timid))
        
        move1 = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 100, moveType: .physical)
        move2 = Move(name: "Astonish", type: Types.Ghost, power: 30, pp: 15, accuracy: 100, moveType: .physical)
        move3 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Tackle", type: Types.Normal, power: 40, pp: 35, accuracy: 100, moveType: .physical)
        status = Status(hp: 160, attack: 110, defense: 65, specialAttack: 65, specialDefense: 110, speed: 30)
        pokemons.append(Pokemon(name: "Snorlax", type: [Types.Normal], moves: [move1, move2, move3, move4], status: status, sprites: [snorlaxB, snorlaxF], nature: Nature.Careful))
        
        move1 = Move(name: "Blizzard", type: Types.Ice, power: 110, pp: 5, accuracy: 70, moveType: .special)
        move2 = Move(name: "Icy Wind", type: Types.Ice, power: 55, pp: 15, accuracy: 95, moveType: .special)
        move3 = Move(name: "Surf", type: Types.Water, power: 90, pp: 15, accuracy: 100, moveType: .special)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 130, attack: 85, defense: 80, specialAttack: 85, specialDefense: 95, speed: 60)
        pokemons.append(Pokemon(name: "Lapras", type: [Types.Ice, Types.Water], moves: [move1, move2, move3, move4], status: status, sprites: [laprasB, laprasF], nature: Nature.Adamant))
        
        move1 = Move(name: "Psystrike", type: Types.Psychic, power: 100, pp: 10, accuracy: 100, moveType: .special)
        move2 = Move(name: "Psychic", type: Types.Psychic, power: 90, pp: 10, accuracy: 100, moveType: .special)
        move3 = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 15, accuracy: 100, moveType: .special)
        move4 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 106, attack: 110, defense: 90, specialAttack: 154, specialDefense: 90, speed: 130)
        pokemons.append(Pokemon(name: "MewTwo", type: [Types.Psychic], moves: [move1, move2, move3, move4], status: status, sprites: [mewtwoB, mewtwoF], nature: Nature.Docile))
        
        move1 = Move(name: "Poltergeist", type: Types.Ghost, power: 110, pp: 5, accuracy: 90, moveType: .physical)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 95, pp: 10, accuracy: 100, moveType: .special)
        move3 = Move(name: "Confusion", type: Types.Psychic, power: 50, pp: 25, accuracy: 100, moveType: .special)
        move4 = Move(name: "Shadow Ball", type: Types.Ghost, power: 80, pp: 15, accuracy: 100, moveType: .special)
        status = Status(hp: 60, attack: 65, defense: 60, specialAttack: 130, specialDefense: 75, speed: 110)
        pokemons.append(Pokemon(name: "Gengar", type: [Types.Ghost, Types.Poison], moves: [move1, move2, move3, move4], status: status, sprites: [gengarB, gengarF], nature: Nature.Timid))
        
        move1 = Move(name: "Rock Tomb", type: Types.Rock, power: 60, pp: 15, accuracy: 95, moveType: .physical)
        move2 = Move(name: "Earthquake", type: Types.Ground, power: 100, pp: 10, accuracy: 100, moveType: .physical)
        move3 = Move(name: "Body Press", type: Types.Fighting, power: 80, pp: 10, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Mud Slap", type: Types.Ground, power: 20, pp: 10, accuracy: 100, moveType: .special)
        status = Status(hp: 105, attack: 130, defense: 120, specialAttack: 45, specialDefense: 45, speed: 40)
        pokemons.append(Pokemon(name: "Rhydon", type: [Types.Ground, Types.Rock], moves: [move1, move2, move3, move4], status: status, sprites: [rhydonB, rhydonF], nature: Nature.Adamant))
        
        move1 = Move(name: "Diamond Storm", type: Types.Rock, power: 100, pp: 5, accuracy: 95, moveType: .physical)
        move2 = Move(name: "Smack Down", type: Types.Rock, power: 50, pp: 15, accuracy: 100, moveType: .physical)
        move3 = Move(name: "Earth Power", type: Types.Ground, power: 90, pp: 10, accuracy: 100, moveType: .special)
        move4 = Move(name: "Mud Slap", type: Types.Ground, power: 20, pp: 10, accuracy: 100, moveType: .special)
        status = Status(hp: 35, attack: 45, defense: 160, specialAttack: 30, specialDefense: 45, speed: 70)
        pokemons.append(Pokemon(name: "Onix", type: [Types.Rock, Types.Ground], moves: [move1, move2, move3, move4], status: status, sprites: [onixB, onixF], nature: Nature.Sassy))
        
        move1 = Move(name: "Super Power", type: Types.Fighting, power: 120, pp: 5, accuracy: 100, moveType: .physical)
        move2 = Move(name: "X Scissor", type: Types.Bug, power: 80, pp: 15, accuracy: 100, moveType: .physical)
        move3 = Move(name: "Body Slam", type: Types.Normal, power: 85, pp: 15, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Smack Down", type: Types.Rock, power: 50, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 90, attack: 130, defense: 80, specialAttack: 65, specialDefense: 85, speed: 55)
        pokemons.append(Pokemon(name: "Machamp", type: [Types.Fighting], moves: [move1, move2, move3, move4], status: status, sprites: [machampB, machampF], nature: Nature.Adamant))
        
        move1 = Move(name: "Outrage", type: Types.Dragon, power: 120, pp: 10, accuracy: 100, moveType: .physical)
        move2 = Move(name: "Dragon Pulse", type: Types.Dragon, power: 85, pp: 10, accuracy: 100, moveType: .special)
        move3 = Move(name: "Flamethrower", type: Types.Fire, power: 90, pp: 15, accuracy: 100, moveType: .special)
        move4 = Move(name: "Gust", type: Types.Flying, power: 40, pp: 35, accuracy: 100, moveType: .special)
        status = Status(hp: 91, attack: 134, defense: 95, specialAttack: 100, specialDefense: 100, speed: 80)
        pokemons.append(Pokemon(name: "Dragonite", type: [Types.Dragon, Types.Flying], moves: [move1, move2, move3, move4], status: status, sprites: [dragoniteB, dragoniteF], nature: Nature.Adamant))
        
        move1 = Move(name: "First Impression", type: Types.Normal, power: 90, pp: 10, accuracy: 100, moveType: .physical)
        move2 = Move(name: "Wing Attack", type: Types.Flying, power: 60, pp: 35, accuracy: 100, moveType: .physical)
        move3 = Move(name: "Astonish", type: Types.Ghost, power: 30, pp: 15, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Acid", type: Types.Poison, power: 40, pp: 30, accuracy: 100, moveType: .special)
        status = Status(hp: 60, attack: 45, defense: 50, specialAttack: 90, specialDefense: 80, speed: 70)
        pokemons.append(Pokemon(name: "Butterfree", type: [Types.Bug, Types.Flying], moves: [move1, move2, move3, move4], status: status, sprites: [butterfreeB, butterfreeF], nature: Nature.Timid))
        
        move1 = Move(name: "Gunk Shot", type: Types.Poison, power: 120, pp: 5, accuracy: 80, moveType: .physical)
        move2 = Move(name: "Sludge Wave", type: Types.Poison, power: 95, pp: 10, accuracy: 100, moveType: .special)
        move3 = Move(name: "Vine Whip", type: Types.Grass, power: 45, pp: 25, accuracy: 100, moveType: .physical)
        move4 = Move(name: "Breaking Swipe", type: Types.Dragon, power: 60, pp: 15, accuracy: 100, moveType: .physical)
        status = Status(hp: 60, attack: 95, defense: 69, specialAttack: 65, specialDefense: 79, speed: 80)
        pokemons.append(Pokemon(name: "Arbok", type: [Types.Poison], moves: [move1, move2, move3, move4], status: status, sprites: [arbokB, arbokF], nature: Nature.Timid))
        
        return pokemons
    }
    
    func getPokemons() -> [Pokemon] { return self.pokemons }
}
