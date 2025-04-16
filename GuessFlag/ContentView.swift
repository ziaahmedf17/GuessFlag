//
//  ContentView.swift
//  GuessFlag
//
//  Created by Zi on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antarctica"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
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
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 60)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                        }
                    
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore)
        {
            Button("Continue", action: askQuestion)
        }
        message: {
            Text("Your score ???")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
        scoreTitle = "Correct"
        }
        else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion()
    {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
#Preview {
    ContentView()
}
