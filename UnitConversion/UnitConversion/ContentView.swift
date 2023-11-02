//
//  ContentView.swift
//  UnitConversion
//
//  Created by HONG JEONGSEOB on 2023/11/02.
//

import SwiftUI

enum ConversionType: String, CaseIterable {
    case temperature
    case length
    case time
    case volume
}

enum TemperatureUnit: String, CaseIterable {
    case celsius, fahrenheit, kelvin
}

enum LengthUnit: String, CaseIterable {
    case meters, kilometers, feet, yards, miles
}

enum TimeUnit: String, CaseIterable {
    case seconds, minutes, hours, days
}

enum VolumeUnit: String, CaseIterable {
    case milliliters, liters, cups, pints, gallons
}

struct ContentView: View {
    @State private var conversionType: ConversionType = .temperature
    @State private var inputValue: Double = 0
    @State private var inputUnit: TemperatureUnit = .celsius
    @State private var outputUnit: TemperatureUnit = .celsius

    var convertedOutputValue: Double {
        var baseCelsiusUnitValue: Double = 0
        var convertedOutputValue: Double = 0

        switch inputUnit {
        case .celsius:
            baseCelsiusUnitValue = inputValue
        case .fahrenheit:
            baseCelsiusUnitValue = (inputValue - 32) * 5 / 9
        case .kelvin:
            baseCelsiusUnitValue = inputValue - 273.15
        }

        switch outputUnit {
        case .celsius:
            convertedOutputValue = baseCelsiusUnitValue
        case .fahrenheit:
            convertedOutputValue = (baseCelsiusUnitValue * 9 / 5) + 32
        case .kelvin:
            convertedOutputValue = baseCelsiusUnitValue + 273.15
        }

        return convertedOutputValue
    }

    var body: some View {
        Form {
            Section("ConversionType") {
                Picker("Conversion", selection: $conversionType) {
                    ForEach(ConversionType.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Input") {
                TextField("Input", value: $inputValue, format: .number)
            }

            Section("Conversion") {
                VStack {
                    Text("\(conversionType.rawValue.uppercased())")
                    HStack {
                        Picker("Conversion", selection: $inputUnit) {
                            ForEach(TemperatureUnit.allCases, id: \.self) {
                                Text("\($0.rawValue)")
                            }
                        }
                        .pickerStyle(.wheel)


                        Text(">")
                        Picker("Conversion", selection: $outputUnit) {
                            ForEach(TemperatureUnit.allCases, id: \.self) {
                                Text("\($0.rawValue)")
                            }
                        }
                        .pickerStyle(.wheel)

                    }
                    .padding(.zero)
                }

            }
            Section("Output") {
                Text("\(convertedOutputValue)")
            }
        }
    }
}

#Preview {
    ContentView()
}
