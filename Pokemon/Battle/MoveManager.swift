class MoveManager {
    static private func willHit(usedMove: Move) -> Bool {
        let accuracy: Int = usedMove.getAccuracy()
        let randomNumber: Int = Int.random(in: 1...100)
        
        return randomNumber <= accuracy
    }
    
    static private func isCritic() -> Double {
        let randomNumber: Int = Int.random(in: 1...100)
        
        return randomNumber <= 20 ? 1.5 : 1.0
    }
    
    static private func randomDamage() -> Double {
        let randomNumber: Int = Int.random(in: 85...100)
        
        return Double(randomNumber) / 100
    }
    
    static func useMove(attacker: Pokemon, usedMove: Move, target: Pokemon) -> ResultAttack {
        guard usedMove.reducePp() else {
            return .NoPP
        }
        
        guard willHit(usedMove: usedMove) else {
            return .Miss
        }
        
        return applyDamage(from: attacker, with: usedMove, to: target)
    }
    
    static private func applyDamage(from attacker: Pokemon, with move: Move, to target: Pokemon) -> ResultAttack {
        let moveType = move.getType()
        let effectiveness = target.getWeakness()[moveType] ?? 1.0
        let result = effectivenessResult(for: effectiveness)
        
        let totalDamage = calculateDamage(from: attacker, with: move, to: target)
        
        target.changeHealth(amount: -totalDamage)
        
        return result
    }
    
    static func calculateDamage(from attacker: Pokemon, with move: Move, to target: Pokemon) -> Int {
        let moveType = move.getType()
        let effectiveness = target.getWeakness()[moveType] ?? 1.0
        
        let attackStat = move.getMoveType() == .physical ? attacker.getStatus().getAttack() : attacker.getStatus().getSpecialAttack()
        let defenseStat = move.getMoveType() == .physical ? target.getStatus().getAttack() : target.getStatus().getSpecialAttack()
        
        let baseDamage = calculateBaseDamage(
            level: 50,
            power: move.getPower(),
            attack: attackStat,
            defense: defenseStat
        )
        
        let modifier = calculateModifier(attacker: attacker, move: move, moveType: moveType, effectiveness: effectiveness)
        let totalDamage = Int(Double(baseDamage) * modifier)
        
        return totalDamage
    }
    
    static private func calculateBaseDamage(level: Int, power: Int, attack: Int, defense: Int) -> Int {
        let firstPart = ((2 * level) / 5) + 2
        let secondPart = Double(firstPart) * Double(power) * (Double(attack) / Double(max(defense, 1)))
        let base = Int((secondPart / 50) + 2)
        
        return base
    }
    
    static private func calculateModifier(attacker: Pokemon, move: Move, moveType: Types, effectiveness: Double) -> Double {
        let stab = attacker.getType().contains(moveType) ? 1.5 : 1.0
        let critical = isCritic()
        let random = randomDamage()
        
        let targets = 1.0
        let pb = 1.0
        let weather = 1.0
        let gr = 1.0
        let burn = 1.0
        let other = 1.0
        
        return stab * effectiveness * critical * random * targets * pb * weather * gr * burn * other
    }
    
    static private func effectivenessResult(for multiplier: Double) -> ResultAttack {
        switch multiplier {
        case 0.0: return .Immune
        case 0.25, 0.5: return .NotVeryEffective
        case 2.0, 4.0: return .SuperEffective
        default: return .Hit
        }
    }
}
