//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by HONG JEONGSEOB on 2023/11/09.
//

import SwiftUI

struct ContentView: View {
    let maxGameCount = 2

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingResult = false
    @State private var showingReset = false
    @State private var score = 0
    @State private var guessResult = ""
    @State private var guessResultDetail = ""
    @State private var currentGameCount = 0

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: .blue, location: 0.3),
                    .init(color: .red, location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700)
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.headline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 50))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(guessResult, isPresented: $showingResult) {
            Button("Continue", action: continueQuiz)
        } message: {
            Text(guessResultDetail)
        }
        .alert("Finish", isPresented: $showingReset) {
            Button("Do Again", action: reset)
        } message: {
            Text(" \(maxGameCount) Quiz over. Your score is \(score)")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            guessResult = "Correct"
            guessResultDetail = "Good job"
            score += 1
        } else {
            guessResult = "Wrong"
            guessResultDetail = "Wrong! That’s the flag of \(countries[correctAnswer])"
        }

        showingResult = true
    }

    func continueQuiz() {
        currentGameCount += 1

        if currentGameCount == maxGameCount {
            showingReset = true
        }
        else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }

    func reset() {
        currentGameCount = 0
        continueQuiz()
    }
}

#Preview {
    ContentView()
}
