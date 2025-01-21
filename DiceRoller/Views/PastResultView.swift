//
//  PastResultView.swift
//  DiceRoller
//
//  Created by Grace couch on 20/01/2025.
//

import SwiftUI

struct PastResultView: View {

    @State private var viewModel = PastResultViewModel()
    var body: some View {
        Group {
            if viewModel.diceResults.isEmpty {
                HStack {
                    Image(systemName: "dice.fill")

                    Text("No results yet...")
                        .font(.title.bold())
                }
                Text("Roll the dice to see some results!")


            } else {
                List {
                    ForEach(viewModel.diceResults, id: \.self) { result in
                        Text("\(result.roll)")
                    }
                }
            }
        }
        .onAppear(perform: viewModel.loadDiceResults)
    }
}

#Preview {
    PastResultView()
}
