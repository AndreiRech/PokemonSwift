//
//  Status.swift
//  Pokemon
//
//  Created by Andrei Rech on 09/05/25.
//

class Status {
    private var hp: Int
    private var attack: Int
    private var defense: Int
    private var specialAttack: Int
    private var specialDefense: Int
    private var speed: Int

    init(hp: Int, attack: Int, defense: Int, specialAttack: Int, specialDefense: Int, speed: Int) {
        self.hp = hp
        self.attack = Status.calculateStatus(base: attack)
        self.defense = Status.calculateStatus(base: defense)
        self.specialAttack = Status.calculateStatus(base: specialAttack)
        self.specialDefense = Status.calculateStatus(base: specialDefense)
        self.speed = Status.calculateStatus(base: speed)
    }

    func getHp() -> Int { return self.hp }
    func setHp(hp: Int) { self.hp = hp }
    
    func getAttack() -> Int { return self.attack }
    func setAttack(attack: Int) { self.attack = attack }
    
    func getDefense() -> Int { return self.defense }
    func setDefense(defense: Int) { self.defense = defense }
    
    func getSpecialAttack() -> Int { return self.specialAttack }
    func setSpecialAttack(specialAttack: Int) { self.specialAttack = specialAttack }
    
    func getSpecialDefense() -> Int { return self.specialDefense }
    func setSpecialDefense(specialDefense: Int) { self.specialDefense = specialDefense }
    
    func getSpeed() -> Int { return self.speed }
    func setSpeed(speed: Int) { self.speed = speed }
    
    private static func calculateStatus(base: Int) -> Int {
        let iv = 0
        let ev = 0
        let nature = 1.0
        let level = 50

        let firstPart = 2 * base + iv + (ev / 4)
        let secondPart = Double(firstPart * level) / 100.0
        let final = Int((secondPart + 5) * nature)

        return final
    }
}
