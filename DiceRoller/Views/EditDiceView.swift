//
//  EditDiceView.swift
//  DiceRoller
//
//  Created by Grace couch on 15/01/2025.
//

import SwiftUI

struct EditDiceView: View {
    @Binding var diceManager: DiceManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                Section("Number of Dice") {
                    Picker("Choose number of dice", selection: $diceManager.numberOfDice) {
                        ForEach(1..<5) { dice in
                            Text("\(dice)")
                                .tag(dice)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Number of sides") {
                    Picker("Choose number of sides", selection: $diceManager.numberOfSides) {
                        ForEach(2..<13) { sides in
                            Text("\(sides)")
                                .tag(sides)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var diceManager = DiceManager()
    EditDiceView(diceManager: $diceManager)
}
