//
//  ContentView.swift
//  GuessFlag
//
//  Created by Zi on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert")
        {
            showingAlert = true
        }
        .alert("Showing Message", isPresented: $showingAlert)
        {
            Button("Delete", role: .destructive)
            {
                
            }
            Button("Cancel", role: .cancel)
            {
                
            }
        }
    message:
        {
         Text("Please Read This")
        }
    }
}
#Preview {
    ContentView()
}
