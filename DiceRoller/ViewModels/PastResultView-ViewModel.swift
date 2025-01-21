//
//  PastResultView-ViewModel.swift
//  DiceRoller
//
//  Created by Grace couch on 20/01/2025.
//

import SwiftUI


@Observable
class PastResultViewModel {
    var diceResults = [DiceResult]()

    let savePath = URL.documentsDirectory.appending(path: "SavedDiceResults")
    func loadDiceResults() {
        do {
            let data = try Data(contentsOf: savePath)
            diceResults = try JSONDecoder().decode([DiceResult].self, from: data)
        } catch {
            print(error.localizedDescription)
            diceResults = []
        }
    }
}
