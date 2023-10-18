//
//  ContentView.swift
//  WeSplit
//
//  Created by HONG JEONGSEOB on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    let students = ["harry", "ron", "hermione", "harry"]
    @State private var selectedStudent = ""

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
