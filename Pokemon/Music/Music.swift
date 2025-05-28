struct Music {
    private static let basePath = "/Users/rechandrei/Documents/Apps/Personal/Pokemon/Pokemon/Music/"
    
    static let battle: String = basePath + "Battle.mp3"
    static let win: String = basePath + "Win.mp3"
    static let lose: String = basePath + "PokemonLossMusic.mp3"
    static let criticalHealth: String = basePath + "CriticalHealth.mp3"
    static let healM: String = basePath + "Heal.mp3"
    static let hit: String = basePath + "Hit.mp3"
    static let hitNot: String = basePath + "HitNot.mp3"
    static let out: String = basePath + "Out.mp3"
    
    static let musicPlayer = Player()
    static let musicPlayerLow = Player()
    static let musicPlayerHelper = Player()
}
