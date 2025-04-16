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
    @State private var score = 0
    
    var body: some View {
        ZStack
        {
            RadialGradient(stops: [
                .init(color: Color(red:
            0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                Text ("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            VStack(spacing: 15)
            {
                VStack
                {
                    Text("Tap the flag of:")
                        .foregroundColor(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
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
                                    .clipShape(Capsule())
                        }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Total Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore)
        {
            Button("Continue", action: askQuestion)
        }
        message: {
            Text("Your score is \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
        scoreTitle = "Correct"
            score = score+1
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
