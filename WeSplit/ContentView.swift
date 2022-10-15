//
//  ContentView.swift
//  WeSplit
//
//  Created by Dillon Waugh on 15/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkTotal = 0.0
    @State private var personCount = 2
    @State private var tipPercentage = 15
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalTipPerPerson: Double {
        let numberOfPersons = Double(personCount + 2)
        let chosenTip = Double(tipPercentage)
        let calculatedTipAmount = checkTotal / 100 * chosenTip
        let grandTotal = checkTotal + calculatedTipAmount
        let tipSplitAmount = grandTotal / numberOfPersons
        return tipSplitAmount    }
    
    var body: some View {
        NavigationView{
            HStack{
                Form{
                    Section{
                        TextField("Amount", value: $checkTotal, format: .currency(code: Locale.current.currencyCode ?? "JMD")) //formatting value to regional currency
                            .keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $personCount) {
                            ForEach(2..<17){
                                Text("\($0) People")
                            }
                        }
                    }
                    
                    Section{
                        //
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.wheel)
                    } header: {
                        Text("Select Tip Percentage") //Adds clear title for tip selection
                    }
                    
                    Section{
                        Text(totalTipPerPerson, format: .currency(code: Locale.current.currencyCode ?? "JMD"))
                    }
                    .navigationTitle("WeSplit")
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
