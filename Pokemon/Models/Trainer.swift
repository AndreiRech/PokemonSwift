class Trainer: Equatable, Hashable {
    let id: Int
    private var team: [Pokemon] = []
    private var bag: Bag
    private var activePokemon: Pokemon?
    
    init(id: Int) {
        self.id = id
        self.bag = Bag()
    }
    
    func createTeam(pokemon: [Pokemon]) {
        for p in pokemon {
            self.team.append(p)
        }
        self.activePokemon = self.team.first
    }
    
    func getTeam() -> [Pokemon] { return self.team }
    func getBag() -> Bag { return self.bag }
    
    func getActivePokemon() -> Pokemon {
        let active = self.activePokemon
        
        guard let active = active else {
            fatalError("No active Pokemon")
        }
        
        return active
    }
    
    func setActivePokemon(index: Int) {
        self.activePokemon = self.team[index]
    }
    
    func setActivePokemon(pokemon: Pokemon) {
        self.activePokemon = pokemon
    }
    
    static func == (lhs: Trainer, rhs: Trainer) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
