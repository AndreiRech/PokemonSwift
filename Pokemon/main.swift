// PC's to choose the pokemons
let pc = Pc()
let pc2 = Pc()

// Trainers
var trainer1 = Trainer(id: 1)
var trainer2 = Trainer(id: 2)

// Actual teams
var team1: [Pokemon] = []
var team2: [Pokemon] = []

// Used Moves
var userUsedMove: Move?
var pcUsedMove: Move?
var userAction: Int = -1

// If need a new Pokemon
var userNewPokemon: Pokemon?
var pcNewPokemon: Pokemon?

// Who won
var victory: Trainer?

// UI
var battleUi = BattleUi()

// Build team
Menu.buildTeam(trainer: trainer1, pc: pc)
Menu.buildTeam(trainer: trainer2, pc: pc2)

// Play the game
GameManager.game(trainer1: trainer1, trainer2: trainer2)
