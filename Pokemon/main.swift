// PC's to choose the pokemons
let pc1 = Pc()
let pc2 = Pc()

// Trainers
var user = Trainer(id: 1)
var pc = Trainer(id: 2)

// Actual teams
var userTeam: [Pokemon] = []
var pcTeam: [Pokemon] = []

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
Menu.buildTeam(trainer: user, pc: pc1)
Menu.buildTeam(trainer: pc, pc: pc2)

// Play the game
GameManager.game(user: user, pc: pc)
