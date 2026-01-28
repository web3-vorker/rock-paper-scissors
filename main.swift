enum Gesture: CaseIterable {
  case rock
  case paper
  case scissors

  var title: String {
    switch self {
      case .rock: return "Камень"
      case .paper: return "Бумага"
      case .scissors: return "Ножницы"
    }
  }
}


enum GameResult {
  case win
  case lose
  case draw

  var title: String {
    switch self {
      case .win: return "Победа"
      case .lose: return "Поражение"
      case .draw: return "Ничья"
    }
  }
}


struct GameEngine {

  var playerScore: Int = 0
  var botScore: Int = 0

  func botMove() -> Gesture {
    return Gesture.allCases.randomElement()!
  }

  mutating func result(_ player: Gesture, _ bot: Gesture) -> GameResult {
    if player == bot {
      return .draw
    }
    
    switch (player, bot) {
      case(.rock, .scissors),
          (.scissors, .paper),
          (.paper, .rock):
          playerScore += 1
          return .win
      default: 
        botScore += 1
        return .lose
        
    }
  }

  func score() -> String {
    return """
            Счет игрока: \(playerScore)
            Счет бота: \(botScore)
            """
  }

}

// Движок игры
var gameEngine = GameEngine()


gameLoop: while true {
  // Запрашиваем действие игрока
  print("\n---Добро пожаловать в камень-ножницы-бумага---")
  print("""
    Выберите жест:
    1 - Камень
    2 - Ножницы
    3 - Бумага
    4 - Показать счет
    """)

  guard let input = readLine(), !input.isEmpty else { 
    print("Введите выбор: ")
    continue
  }

  let player: Gesture

  switch input {
    case "1": 
      player = .rock
    case "2": 
      player = .scissors
    case "3": 
      player = .paper
    case "4": 
      print(gameEngine.score())
      continue
    default: 
      print("Неизвестный выбор")
      continue
  }

  // Рандомный ход бота
  let bot = gameEngine.botMove()
  // Запускаем игру
  let result = gameEngine.result(player, bot)

  print("Игрок: \(player.title)")
  print("Бот: \(bot.title)")
  print("Результат: \(result.title)")
  print("Счет: [\(gameEngine.playerScore) : \(gameEngine.botScore)]")

  // Продолжить или выйти
  print("Хотите продолжить? (выберите цифру) \n1. да\n2. выйти")
  guard let choice = readLine(), !choice.isEmpty else {
    print("Введите выбор: ")
    continue
  }

  switch choice {
    case "1": continue
    case "2": 
      print("Выход...")
      break gameLoop
    default: print("Неизвестный выбор")
    continue
  }

}