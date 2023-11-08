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

    var shortName: String {
        switch self {
        case .temperature: return "temp"
        case .length:      return "length"
        case .time:        return "time"
        case .volume:      return "vloume"
        }
    }
}

enum TemperatureUnit: String, CaseIterable {
    case celsius, fahrenheit, kelvin

    var unitMark: String {
        switch self {
        case .celsius:
            return "°C"
        case .fahrenheit:
            return "°F"
        case .kelvin:
            return "K"
        }
    }

    func convertBaseUnit(value: Double) -> Double {
        switch self {
        case .celsius:
            return value
        case .fahrenheit:
            return (value - 32) * 5 / 9
        case .kelvin:
            return value - 273.15
        }
    }

    func convert(baseUnitValue: Double) -> Double {
        switch self {
        case .celsius:
            return baseUnitValue
        case .fahrenheit:
            return (baseUnitValue * 9 / 5) + 32
        case .kelvin:
            return baseUnitValue + 273.15
        }
    }
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
        let baseUnitValue = inputUnit.convertBaseUnit(value: inputValue)
        return outputUnit.convert(baseUnitValue: baseUnitValue)
    }

    var body: some View {
        Form {
            Section("ConversionType") {
                Picker("Conversion", selection: $conversionType) {
                    ForEach(ConversionType.allCases, id: \.self) {
                        Text("\($0.shortName)")
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
                                Text("\($0.rawValue)(\($0.unitMark))")
                                    .font(.subheadline)
                            }
                        }
                        .pickerStyle(.wheel)


                        Text(">")
                        Picker("Conversion", selection: $outputUnit) {
                            ForEach(TemperatureUnit.allCases, id: \.self) {
                                Text("\($0.rawValue)(\($0.unitMark))")
                                    .font(.subheadline)
                            }
                        }
                        .pickerStyle(.wheel)

                    }
                    .padding(.zero)
                }

            }
            Section("Output") {
                Text("\(convertedOutputValue)\(outputUnit.unitMark)")
            }
        }
    }
}

#Preview {
    ContentView()
}
