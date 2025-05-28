class GameManager {
    static func game(user: Trainer, pc: Trainer) {
        userTeam = user.getTeam()
        pcTeam = pc.getTeam()
        
        battleUi.setTeams(userTeam: userTeam, pcTeam: pcTeam)
        
        Music.musicPlayer.play(song: Music.battle)
        
        repeat {
            // Estado atual do jogo + Turno do Usuario
            BattleManager.battle(user: user, pc: pc)
            
            // Turno do PC
            PcActions.turn(user: user, pc: pc)
            
            // Calcular Resutado
            ResultCalculator.calculateResults(user: user, pc: pc)
            
            userUsedMove = nil
            pcUsedMove = nil
            
        } while (victory == nil)
    }    
}
