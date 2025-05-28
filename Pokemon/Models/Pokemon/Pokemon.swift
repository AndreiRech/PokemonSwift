import Foundation

class Pokemon {
    private var name: String
    private var type: [Types]
    private var moves: [Move]
    private var status: Status
    private var sprites: [String]
    private var weakness: [Types: Double] = [:]
    private var health: Int = 0
    private var currentHealth: Int = 0
    private var isAlive: Bool = true
    private var level: Int = 50
    private var nature: Nature
    
    init (name: String, type: [Types], moves: [Move], status: Status, sprites: [String], nature: Nature) {
        self.name = name
        self.type = type
        self.moves = moves
        self.status = status
        self.sprites = sprites
        self.nature = nature
        setWeakness()
        setHealth()
        setStatusWithNature()
    }
    
    func getName() -> String { return self.name }
    func getHealth() -> Int { return self.health }
    func getType() -> [Types] { return self.type }
    func getMoves() -> [Move] { return self.moves }
    func getStatus() -> Status { return self.status }
    func getSprite() -> [String] { return self.sprites }
    func getWeakness() -> [Types: Double] { return self.weakness }
    func getCurrentHealth() -> Int { return self.currentHealth }
    func getIsAlive() -> Bool { return self.isAlive }
    
    private func setWeakness() {
        var weakness: [Types: Double] = [:]
        for type in self.type {
            let multipliers = type.multiplier()
            for (otherType, multiplier) in multipliers {
                if let existing = weakness[otherType] {
                    weakness[otherType] = existing * multiplier
                } else {
                    weakness[otherType] = multiplier
                }
            }
        }
        return self.weakness = weakness
    }
    
    func setStatusWithNature() {
        let natureEffects = self.nature.multiplier()

        for (affectedStat, multiplier) in natureEffects {
            switch affectedStat {
            case .Attack:
                let currentAttack = self.status.getAttack()
                let newAttack = Int(Double(currentAttack) * multiplier)
                self.status.setAttack(attack: newAttack)
            case .Defense:
                let currentDefense = self.status.getDefense()
                let newDefense = Int(Double(currentDefense) * multiplier)
                self.status.setDefense(defense: newDefense)
            case .SpecialAttack:
                let currentSpecialAttack = self.status.getSpecialAttack()
                let newSpecialAttack = Int(Double(currentSpecialAttack) * multiplier)
                self.status.setSpecialAttack(specialAttack: newSpecialAttack)
            case .SpecialDefense:
                let currentSpecialDefense = self.status.getSpecialDefense()
                let newSpecialDefense = Int(Double(currentSpecialDefense) * multiplier)
                self.status.setSpecialDefense(specialDefense: newSpecialDefense)
            case .Speed:
                let currentSpeed = self.status.getSpeed()
                let newSpeed = Int(Double(currentSpeed) * multiplier)
                self.status.setSpeed(speed: newSpeed)
            case .Hp:
                break
            }
        }
    }
    
    private func setHealth() {
        let iv = 0
        let ev = 0
        
        let firstPart = 2 * self.getStatus().getHp() + iv + (ev / 4)
        let secondPart = Double(firstPart * self.level) / 100.0
        let hpFinal = Int(secondPart) + self.level + 10
        
        self.health = hpFinal
        self.currentHealth = hpFinal
    }
    
    func changeHealth(amount: Int) {
        self.currentHealth += amount
        
        if self.currentHealth <= 0 {
            self.currentHealth = 0
            self.isAlive = false
        } else if self.currentHealth > self.health {
            self.currentHealth = self.health
        }
    }
}
