//
//  GuessTheFlag.swift
//  OlwaStick
//
//  Created by Желанов Александр Валентинович on 19.08.2021.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Your content")
            Button("Show Alert") {
                self.showingAlert = true
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            })
            Spacer()
        }
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}


