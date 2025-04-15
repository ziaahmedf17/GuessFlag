//
//  ContentView.swift
//  GuessFlag
//
//  Created by Zi on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antarctica"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack
        {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30)
            {
                VStack
                {
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3)
                {
                    number in
                        Button
                        {
                            //flag was tapped
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                        }
                    
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
