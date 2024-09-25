import Foundation
// Problem 3 Temperature Converter

func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

func convertTemperature(){
    print("Enter the temperature value:")
    guard let input = readLine(), let temperature = Double(input) else{
        print("Please enter a valid number.")
        return
    }
    
    print("Enter the unit of Temperature:")
    guard let unit = readLine() else {
        print("ENTER K F C")
        return
    }
    
    switch unit {
        case "C":
            let fahrenheit = celsiusToFahrenheit(temperature)
            let kelvin = celsiusToKelvin(temperature)
            print("\(temperature)°C is \(fahrenheit)°F and \(kelvin)K")
            
        case "F":
            let celsius = fahrenheitToCelsius(temperature)
            let kelvin = fahrenheitToKelvin(temperature)
            print("\(temperature)°F is \(celsius)°C and \(kelvin)K")
            
        case "K":
            let celsius = kelvinToCelsius(temperature)
            let fahrenheit = kelvinToFahrenheit(temperature)
            print("\(temperature)K is \(celsius)°C and \(fahrenheit)°F")
            
        default:
            print("Invalid unit. Please enter C, F, or K.")
        }
}
convertTemperature();