//
//  RollDiceView.swift
//  DiceRoller
//
//  Created by Grace couch on 15/01/2025.
//

import SwiftUI

struct RollDiceView: View {
    @State private var viewModel = RollDiceViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Button("Roll Dice", systemImage: "dice.fill", action: viewModel.rollDice)
                    .buttonStyle(.borderedProminent)
                    .font(.largeTitle)
                VStack {
                    Text("Sides = \(viewModel.diceManager.numberOfSides)")
                    Text("Dice Count = \(viewModel.diceManager.numberOfDice)")
                }
                .padding()
                .foregroundStyle(.primary)
                .background(.tertiary)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            }
            .alert("Roll result: \(viewModel.diceResults.last?.roll ?? [])", isPresented: $viewModel.showingAlert,
                   actions: {},
                   message: {
                Text("Your total was \(viewModel.diceResults.last?.roll.reduce(0, +) ?? 0)")
            }
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("Past Results", destination: PastResultView())
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit Dice") {
                        viewModel.showingEditSheet = true
                    }
                }

            }
            .sheet(isPresented: $viewModel.showingEditSheet) {
                EditDiceView(diceManager: $viewModel.diceManager)
            }
        }
    }
}




#Preview {
    RollDiceView()
}
