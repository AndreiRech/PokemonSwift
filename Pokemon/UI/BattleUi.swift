import Foundation

class BattleUi {
    private var userTeam: [Pokemon]
    private var pcTeam: [Pokemon]
    
    init() {
        self.userTeam = []
        self.pcTeam = []
    }
    
    func setTeams(userTeam: [Pokemon], pcTeam: [Pokemon]) {
        self.userTeam = userTeam
        self.pcTeam = pcTeam
    }
    
    func printPokemon(pokemonB: Pokemon, pokemonF: Pokemon) {
        let pokemonSpriteB = pokemonB.getSprite()[0]
        let pokemonSpriteF = pokemonF.getSprite()[1]
        
        Auxiliars.printInLines(string1: pokemonSpriteB, string2: pokemonSpriteF, amount: 25)
    }
    
    func printBattle(pokemonB: Pokemon, pokemonF: Pokemon) {
        Auxiliars.clear()
        hpBar(pokemonB: pokemonB, pokemonF: pokemonF)
        print("\n\n")
        printPokemon(pokemonB: pokemonB, pokemonF: pokemonF)
        print("\n")
    }
    
    func printBoard(pokemonB: Pokemon, pokemonF: Pokemon, text: String, damage: Bool? = false) {
        printBattle(pokemonB: pokemonB, pokemonF: pokemonF)
        Menu.runningMenu(text: text)
        
        sleep(2)
    }
    
    func hpBar(pokemonB: Pokemon, pokemonF: Pokemon) {
        let hpB = pokemonB.getHealth()
        let hpF = pokemonF.getHealth()
        
        let currentHpB = pokemonB.getCurrentHealth()
        let currentHpF = pokemonF.getCurrentHealth()
        
        let pokemonNameB = pokemonB.getName()
        let pokemonNameF = pokemonF.getName()
        
        let barB = createHpBar(currentHp: currentHpB, maxHp: hpB, pokemonName: pokemonNameB, team: userTeam)
        let barF = createHpBar(currentHp: currentHpF, maxHp: hpF, pokemonName: pokemonNameF, team: pcTeam)
        
        Auxiliars.printInLines(string1: barB, string2: barF, amount: 50)
    }
    
    func createHpBar(currentHp: Int, maxHp: Int, pokemonName: String, team: [Pokemon]) -> String {
        let hpRatio = Double(currentHp) / Double(maxHp)
        let barLength = 10
        var filledBlocks = Int(hpRatio * Double(barLength))
        let emptyBlocks = barLength - filledBlocks
        
        var count = 0
        for pokemon in team {
            if pokemon.getIsAlive() {
                count += 1
            }
        }
        
        let redCircles = String(repeating: "🔴", count: count)
        let whiteCircles = String(repeating: "⚪️", count: 3 - count)
        let fullTop = pokemonName + "                         " + redCircles + whiteCircles
        
        var color: String = ""
        if hpRatio > 0.50 {
            color = "🟩"
        } else if hpRatio > 0.25 && hpRatio <= 0.50 {
            color = "🟨"
        } else {
            color = "🟥"
        }
        
        if filledBlocks == 0 && currentHp > 0 {
            filledBlocks = 1
        }
        
        let bar = String(repeating: color, count: filledBlocks) + String(repeating: "⬜", count: emptyBlocks)
        
        let fullBar = """
                ═════════════════════ஜ۩۞۩ஜ════════════════════
                  \(fullTop)     
                         ----------------------               
                 ◓  HP | \(bar) |      ♂️ Lv.50
                         ----------------------               
                ══════════════════════════════════════════════
    """
        
        return fullBar
    }
}

