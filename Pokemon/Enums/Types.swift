enum Types : CaseIterable {
    case Ghost, Dragon, Ice, Fire, Electric, Water, Grass, Poison, Flying, Psychic, Rock, Ground, Bug, Normal, Fighting, Fairy, Dark, Steel
    
    func multiplier() -> [Types: Double] {
        switch self {
        case .Normal:
            return [
                .Ghost: 0.0,
                .Fighting: 2.0
            ]
        case .Ghost:
            return [
                .Ghost: 2.0,
                .Normal: 0.0,
                .Fighting: 0.0,
                .Bug: 0.5,
                .Poison: 0.5,
                .Dark: 2.0
            ]
        case .Dragon:
            return [
                .Dragon: 2.0,
                .Ice: 2.0,
                .Fire: 0.5,
                .Water: 0.5,
                .Grass: 0.5,
                .Electric: 0.5,
                .Fairy: 2.0
            ]
        case .Ice:
            return [
                .Fire: 2.0,
                .Ice: 0.5,
                .Fighting: 2.0,
                .Rock: 2.0,
                .Steel: 2.0
            ]
        case .Fire:
            return [
                .Fire: 0.5,
                .Water: 2.0,
                .Grass: 0.5,
                .Ice: 0.5,
                .Bug: 2.0,
                .Ground: 2.0,
                .Rock: 2.0,
                .Steel: 0.5,
                .Fairy: 0.5
            ]
        case .Electric:
            return [
                .Electric: 0.5,
                .Ground: 2.0,
                .Flying: 0.5,
                .Steel: 0.5
            ]
        case .Water:
            return [
                .Fire: 0.5,
                .Water: 0.5,
                .Electric: 2.0,
                .Grass: 2.0,
                .Ice: 0.5,
                .Steel: 0.5
            ]
        case .Grass:
            return [
                .Fire: 2.0,
                .Water: 0.5,
                .Grass: 0.5,
                .Electric: 0.5,
                .Flying: 2.0,
                .Bug: 2.0,
                .Ice: 2.0,
                .Poison: 2.0,
                .Ground: 0.5
            ]
        case .Poison:
            return [
                .Poison: 0.5,
                .Ground: 2.0,
                .Grass: 0.5,
                .Fighting: 0.5,
                .Bug: 0.5,
                .Psychic: 2.0,
                .Fairy: 0.5
            ]
        case .Flying:
            return [
                .Ground: 0.0,
                .Bug: 0.5,
                .Fighting: 0.5,
                .Ice: 2.0,
                .Grass: 0.5,
                .Electric: 2.0,
                .Rock: 2.0
            ]
        case .Psychic:
            return [
                .Fighting: 0.5,
                .Bug: 2.0,
                .Psychic: 0.5,
                .Ghost: 2.0,
                .Dark: 2.0
            ]
        case .Rock:
            return [
                .Fire: 0.5,
                .Normal: 0.5,
                .Water: 2.0,
                .Grass: 2.0,
                .Fighting: 2.0,
                .Poison: 0.5,
                .Flying: 0.5,
                .Rock: 2.0
            ]
        case .Ground:
            return [
                .Water: 2.0,
                .Grass: 2.0,
                .Electric: 0.0,
                .Ice: 2.0,
                .Poison: 0.5,
                .Rock: 0.5
            ]
        case .Bug:
            return [
                .Fire: 2.0,
                .Grass: 0.5,
                .Fighting: 0.5,
                .Ground: 0.5,
                .Flying: 2.0,
                .Rock: 2.0
            ]
        case .Fighting:
            return [
                .Flying: 2.0,
                .Psychic: 2.0,
                .Bug: 0.5,
                .Rock: 0.5,
                .Fairy: 2.0,
                .Dark: 0.5
            ]
        case .Dark:
            return [
                .Fighting: 2.0,
                .Psychic: 0.0,
                .Bug: 2.0,
                .Ghost: 0.5,
                .Dark: 0.5,
                .Fairy: 2.0
            ]
        case .Steel:
            return [
                .Normal: 0.5,
                .Fire: 2.0,
                .Grass: 0.5,
                .Ice: 0.5,
                .Fighting: 2.0,
                .Ground: 2.0,
                .Poison: 0.0,
                .Flying: 0.5,
                .Psychic: 0.5,
                .Bug: 0.5,
                .Rock: 0.5,
                .Dragon: 0.5,
                .Steel: 0.5,
                .Fairy: 0.5
            ]
        case .Fairy:
            return [
                .Fighting: 0.5,
                .Poison: 2.0,
                .Bug: 0.5,
                .Dragon: 0.0,
                .Dark: 0.5,
                .Steel: 2.0
            ]
        }
    }
}
