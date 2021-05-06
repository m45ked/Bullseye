import Foundation

class Game : ObservableObject {
    @Published var target = Int.random(in: 1...100)
    @Published var score = 0
    @Published var round = 1
    @Published var totalScore = 0
    
    func points(sliderValue: Int) -> Int {
        let result = 100 - abs(target - sliderValue)
        return result
    }
    
    func update(sliderValue: Int) {
        incScore(roundScore: points(sliderValue: sliderValue))
        newTarget()
        nextRound()
    }

    func newTarget() {
        self.target = Int.random(in: 1...100)
    }

    func nextRound() {
        self.round += 1
    }

    func incScore(roundScore: Int) {
        self.totalScore += roundScore
    }
}
