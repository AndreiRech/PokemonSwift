class Item: Equatable, Hashable {
    private var name: String
    private var heal: Int
    
    init(name: String, heal: Int) {
        self.name = name
        self.heal = heal
    }
    
    func getName() -> String { return self.name }
    func getHeal() -> Int { return self.heal }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(heal)
    }
}
