//
//  ContentView.swift
//  OlwaStick
//
//  Created by Желанов Александр Валентинович on 09.08.2021.
//

import SwiftUI

struct WeSplit: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    private var useRedText: Bool {
        return tipPercentage == tipPercentages.count-1
    }
        
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total amount for the check")) {
                    if self.useRedText {
                        Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(.red)
                    } else {
                        Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeSplit()
    }
}
