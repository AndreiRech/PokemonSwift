class GameManager {
    static func game(trainer1: Trainer, trainer2: Trainer) {
        team1 = trainer1.getTeam()
        team2 = trainer2.getTeam()
        
        battleUi.setTeams(team1: team1, team2: team2)
        
        Music.musicPlayer.play(song: Music.battle)
        
        repeat {
            // Estado atual do jogo + Turno do Usuario
            BattleManager.battle(trainer1: trainer1, trainer2: trainer2)
            
            // Turno do PC
            PcActions.turn(trainer1: trainer1, trainer2: trainer2)
            
            // Calcular Resutado
            ResultCalculator.calculateResults(trainer1: trainer1, trainer2: trainer2)
            
            userUsedMove = nil
            pcUsedMove = nil
            
        } while (victory == nil)
    }    
}
