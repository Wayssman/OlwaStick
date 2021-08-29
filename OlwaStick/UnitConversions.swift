//
//  UnitConversions.swift
//  OlwaStick
//
//  Created by Желанов Александр Валентинович on 19.08.2021.
//

import SwiftUI

struct TimeConversions: View {
    @State private var initialAmount = ""
    @State private var initialUnit = 0
    @State private var finalUnit = 0
    
    let units = ["сек.", "мин.", "час.", "сут."]
    let unitsMultiplier = [1, 60, 3600, 86400]
    var result: Double {
        let multiplier = Double(unitsMultiplier[initialUnit]) / Double(unitsMultiplier[finalUnit])
        let initialValue = Double(initialAmount) ?? 0
        
        return initialValue * multiplier
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.brown.withAlphaComponent(0.3)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose units and type initial value")) {
                    TextField("Initial value", text: $initialAmount)
                        .keyboardType(.decimalPad)
                    Picker("Choose units", selection: $initialUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Choose final units")) {
                    Picker("Choose units for result", selection: $finalUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.4f")")
                }
            }
            .navigationBarTitle("Time Conversions")
        }
        .foregroundColor(.black)
    }
}

struct TimeConversions_Preview: PreviewProvider {
    static var previews: some View {
        TimeConversions()
    }
}
