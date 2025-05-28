class Move {
    private var name: String
    private var type: Types
    private var power: Int
    private var pp: Int
    private var accuracy: Int
    private var moveType: MoveType
    private var secondaryEffect: MoveEffect?
    
    init(name: String, type: Types, power: Int, pp: Int, accuracy: Int, moveType: MoveType = .physical, secondaryEffect: MoveEffect? = nil) {
        self.name = name
        self.type = type
        self.power = power
        self.pp = pp
        self.accuracy = accuracy
        self.moveType = moveType
        self.secondaryEffect = secondaryEffect
    }
    
    func getName() -> String { return self.name }
    func getType() -> Types { return self.type }
    func getPower() -> Int { return self.power }
    func getPp() -> Int { return self.pp }
    func getAccuracy() -> Int { return self.accuracy }
    func getMoveType() -> MoveType { return self.moveType }
    func getSecondaryEffect() -> MoveEffect? { return self.secondaryEffect }
    
    func reducePp() -> Bool {
        if self.pp > 0 {
            self.pp -= 1
            return true
        }
        return false
    }
}
