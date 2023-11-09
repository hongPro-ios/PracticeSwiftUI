//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by HONG JEONGSEOB on 2023/11/09.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {
            LinearGradient(
                stops: [
                    .init(color: .white, location: 0.45),
                    .init(color: .black, location: 0.66)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 100, endRadius: 200)
            AngularGradient(colors: [.red, .yellow, .green], center: .center)
            HStack {
                Button("Delete selection", role: .destructive, action: executeDelete)
                Button("Button1") {}
                    .buttonStyle(.plain)
                Button("Button2") {}
                    .buttonStyle(.bordered)
                Button("Button3") {}
                    .buttonStyle(.borderedProminent)
                Button("Button4") {}
                    .buttonStyle(.borderless)
            }
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.red)
                .font(.largeTitle)
        }
        .alert("Import message", isPresented: $showingAlert) {
            Button("OK") { print("tes") }
            Button("OK") { print("tes") }
            Button("OK") { print("tes") }
            Button("OK") { print("tes") }
        } message: {
            Text("Please read tihs")
        }
    }

    func executeDelete() {
        print("Delete")
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
