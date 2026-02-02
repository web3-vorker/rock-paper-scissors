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
      print("Пожалуйста, введите число от 1 до 4")
      continue
  }


  switch input {
    case "1": 
      gameEngine.play(playerMove: .rock)
    case "2": 
      gameEngine.play(playerMove: .scissors)
    case "3": 
      gameEngine.play(playerMove: .paper)
    case "4": 
      print("Счет: \(gameEngine.playerScore) : \(gameEngine.botScore)")
      continue
    default: 
      print("Неизвестный выбор")
      continue
  }

  // Получаем результат
  if let result = gameEngine.result,
  let botMove = gameEngine.botMove {
    print("Бот: \(botMove.rawValue)")
    print("Результат: \(result.rawValue)")
  }

  // Спрашиваем, хочет ли игрок продолжить
  print("""
    Выберите действие: 
    1 - продолжить 
    2 - выйти
    """)

  guard let input = readLine(), !input.isEmpty else { 
      print("""
      Пожалуйста выберите действие: 
      1 - продолжить 
      2 - выйти
      """)
      continue
  }

  switch input {
    case "1": continue
    case "2": 
      print("Выход...")
      break gameLoop
    default: print("Неизвестный выбор")
    continue
  }

}
