enum Nature: CaseIterable {
    case Hardy, Lonely, Adamant, Naughty, Brave, Bold, Docile, Impish, Lax, Relaxed, Modest, Mild, Bashful, Rash, Quiet, Calm, Gentle, Careful, Quirky, Sassy, Timid, Hasty, Jolly, Naive, Serious
    
    func multiplier() -> [StatusEnum: Double] {
        switch self {
        case .Hardy:
            return [:]
        case .Lonely:
            return [StatusEnum.Attack:1.1, StatusEnum.Defense:0.9]
        case .Adamant:
            return [StatusEnum.Attack:1.1, StatusEnum.SpecialAttack:0.9]
        case .Naughty:
            return [StatusEnum.Attack:1.1, StatusEnum.SpecialDefense:0.9]
        case .Brave:
            return [StatusEnum.Attack:1.1, StatusEnum.Speed:0.9]
        case .Bold:
            return [StatusEnum.Defense:1.1, StatusEnum.Attack:0.9]
        case .Docile:
            return [:]
        case .Impish:
            return [StatusEnum.Defense:1.1, StatusEnum.SpecialAttack:0.9]
        case .Lax:
            return [StatusEnum.Defense:1.1, StatusEnum.SpecialDefense:0.9]
        case .Relaxed:
            return [StatusEnum.Defense:1.1, StatusEnum.Speed:0.9]
        case .Modest:
            return [StatusEnum.SpecialAttack:1.1, StatusEnum.Attack:0.9]
        case .Mild:
            return [StatusEnum.SpecialAttack:1.1, StatusEnum.Defense:0.9]
        case .Bashful:
            return [:]
        case .Rash:
            return [StatusEnum.SpecialAttack:1.1, StatusEnum.SpecialDefense:0.9]
        case .Quiet:
            return [StatusEnum.SpecialAttack:1.1, StatusEnum.Speed:0.9]
        case .Calm:
            return [StatusEnum.SpecialDefense:1.1, StatusEnum.Attack:0.9]
        case .Gentle:
            return [StatusEnum.SpecialDefense:1.1, StatusEnum.Defense:0.9]
        case .Careful:
            return [StatusEnum.SpecialDefense:1.1, StatusEnum.SpecialAttack:0.9]
        case .Quirky:
            return [:]
        case .Sassy:
            return [StatusEnum.SpecialDefense:1.1, StatusEnum.Speed:0.9]
        case .Timid:
            return [StatusEnum.Speed:1.1, StatusEnum.Attack:0.9]
        case .Hasty:
            return [StatusEnum.Speed:1.1, StatusEnum.Defense:0.9]
        case .Jolly:
            return [StatusEnum.Speed:1.1, StatusEnum.SpecialAttack:0.9]
        case .Naive:
            return [StatusEnum.Speed:1.1, StatusEnum.SpecialDefense:0.9]
        case .Serious:
            return [:]
        }
    }
}
