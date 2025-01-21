//
//  RollDiceView-ViewModel.swift
//  DiceRoller
//
//  Created by Grace couch on 20/01/2025.
//

import SwiftUI

@Observable
class RollDiceViewModel {
    var diceManager = DiceManager()
    var sides: [Int] {
        Array(2...diceManager.numberOfSides)
    }
    var diceCount: [Int] {
        Array(1...diceManager.numberOfDice)
    }
    var diceResults = [DiceResult]()
    var showingEditSheet = false
    var showingAlert = false

    func rollDice() {
        let mappedResult = diceCount.map { _ in
            sides.randomElement()!
        }
        let result = DiceResult(roll: mappedResult)
        diceResults.append(result)
        showingAlert = true
        saveDiceResults()
    }

    let savePath = URL.documentsDirectory.appending(path: "SavedDiceResults")

    func saveDiceResults() {
        do {
            let data = try JSONEncoder().encode(diceResults)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

}
