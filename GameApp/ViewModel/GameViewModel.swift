class GameEngine {

  private(set) var playerScore: Int = 0
  private(set) var botScore: Int = 0
  private(set) var botMove: Gesture?
  private(set) var result: GameResult?


  func play(playerMove: Gesture) {
    guard let botMove = Gesture.allCases.randomElement() else { return }
    self.botMove = botMove

    if playerMove == botMove {
      result = .draw
      return
    }

    switch (playerMove, botMove) {
      case(.rock, .scissors),
          (.scissors, .paper),
          (.paper, .rock):
          playerScore += 1
          result = .win
      default: 
        botScore += 1
        result = .lose
        
    }

  }

}