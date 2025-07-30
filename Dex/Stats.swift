//
//  Stats.swift
//  Dex
//
//  Created by Ana Clara Moreira Rodrigues on 30/07/25.
//

import SwiftUI
//Charts is a framework you can use to transform your data into informative visualizations.
import Charts

struct Stats: View {
    var pokemon: Pokemon
    
    var body: some View {
        Chart(pokemon.stats) { stat in
            BarMark(
                x: .value("Value", stat.value),
                y: .value("Stat", stat.name)
            )
            .annotation(position: .trailing) {
                Text("\(stat.value)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, -5)
            }
        }
        .frame(height: 200)
        .padding([.horizontal, .bottom])
        .foregroundStyle(pokemon.typeColor)
        //changes the scale of the X axis
        .chartXScale(domain: 0...pokemon.highestStat.value+10)
    }
}

#Preview {
    Stats(pokemon: PersistenceController.previewPokemon)
}
