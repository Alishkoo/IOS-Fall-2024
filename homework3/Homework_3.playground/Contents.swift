import UIKit

// Problem 1 FizzBuzz

for i in 1...100{
    if (i % 3 == 0 && i % 5 == 0){
        print("FizzBuzz")
    }
    else if(i % 3 == 0){
        print("Fizz")
    }
    else if(i % 5 == 0){
        print("Buzz")
    }
    else{
        print(i)
    }
}

print("===============================")
// Problem 2 Prime Numbers

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false;
    }
    
    let upperBound = Int(Double(num).squareRoot())
        if upperBound < 2 {
            return true
        }
        
        for i in 2...upperBound {
            if num % i == 0 {
                return false
            }
        }
    
    return true;
}

for j in 1...100 {
    print("\(j) is prime: \(isPrime(j))");
}

print("===============================")
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

// Problem 4
func showMenu() {
    print("""
    Menu:
    1. Add an item to the shopping list
    2. Remove an item from the shopping list
    3. View current shopping list
    4. Exit
    """)
}


func addItem(to list: inout [String]) {
    print("Please enter the item to add:")
    if let item = readLine(), !item.isEmpty {
        list.append(item)
        print("'\(item)' has been added to your shopping list.")
    } else {
        print("Error: Item name cannot be empty.")
    }
}


func removeItem(from list: inout [String]) {
    print("Please enter the name of the item to remove:")
    if let item = readLine(), let index = list.firstIndex(of: item) {
        list.remove(at: index)
        print("'\(item)' has been removed from your shopping list.")
    } else {
        print("Item not found in the list.")
    }
}


func showList(_ list: [String]) {
    if list.isEmpty {
        print("Your shopping list is currently empty.")
    } else {
        print("Current shopping list:")
        for (index, item) in list.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}


func shoppingListApp() {
    var shoppingList: [String] = []
    var isRunning = true
    
    while isRunning {
        showMenu()
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                addItem(to: &shoppingList)
            case 2:
                removeItem(from: &shoppingList)
            case 3:
                showList(shoppingList)
            case 4:
                isRunning = false
                print("Exiting the application.")
            default:
                print("Invalid choice. Please try again.")
            }
        } else {
            print("Invalid input. Please enter a number between 1 and 4.")
        }
    }
}

shoppingListApp()

// Problem 5

func clearWords(from sentence: String) -> [String : Int] {
    let cleaned = sentence.lowercased().filter{
        !$0.isPunctuation
    }
    
    
    let words = cleaned.split(separator: " ").map{ String($0)}
    
    var dict: [String : Int] = [:]
    
    for word in words{
        dict[word, default: 0] += 1
    }
    
    return dict
}

func countWords(){
    print("Enter a sentence")
    
    if let input = readLine() {
        let words = clearWords(from: input)
        
        print("\nWord Counts:")
        
        for (word, count) in words {
            print("\(word): \(count)")
        }
    }
    else {
        print("Invalid input")
    }
}

countWords()

// Problem 6

func fibonacci(_ n : Int) -> [Int]{
    
    guard n > 0 else { return []}
    
    if n == 1 {
            return [0]
        }
    
    var fib: [Int] = [0, 1]
    
    for i in 2..<n {
        fib.append(fib[i - 1] + fib[i - 2])
    }
    
    return fib;
}

// Problem 7

func gradeCalculator(students: [String:Int]){
    let scores = Array(students.values)
    
    let total: Double = Double(scores.reduce(0, +))
    let average = total / Double(scores.count)
    
    let highScore = scores.max()
    let lowScore = scores.min()
    
    print("Average: \(average)")
    print("Highest: \(highScore ?? 0)")
    print("Lowest: \(String(describing: lowScore))")
    
    for(name, score) in students{
        let status = score >= Int(average) ? "above" : "below"
        print("\(name): \(score) (\(status) average)")
    }
}

var studentScores: [String: Int] = [
    "Nurken": 85,
    "Kamila": 92,
    "Alan": 86,
    "Parker": 88,
    "Peter": 90
]

gradeCalculator(students: studentScores)


//Problem 8

func isPalindrome(_ text: String) -> Bool{
    let cleanedText = text.lowercased().filter{ $0.isLetter }
    
    return cleanedText == String(cleanedText.reversed())
}

//Problem 9




func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}


func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}


func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}


func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Cannot divide by zero.")
        return nil
    }
    return a / b
}


func getUserInput() -> (Double, Double, String)? {
    print("Enter first number:")
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Invalid input for first number.")
        return nil
    }

    print("Enter second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input for second number.")
        return nil
    }

    print("Choose an operation (+, -, *, /):")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        print("Invalid operation selected.")
        return nil
    }

    return (num1, num2, operation)
}


func calculate() {
    if let (num1, num2, operation) = getUserInput() {
        var result: Double?

        switch operation {
        case "+":
            result = add(num1, num2)
        case "-":
            result = subtract(num1, num2)
        case "*":
            result = multiply(num1, num2)
        case "/":
            result = divide(num1, num2)
        default:
            print("Operation not recognized.")
        }

        if let finalResult = result {
            print("Result: \(finalResult)")
        }
    }
}


func runCalculator() {
    var keepGoing = true

    while keepGoing {
        calculate()

        print("Do you want to do another calculation? (yes/no):")
        if let response = readLine()?.lowercased(), response != "yes" {
            keepGoing = false
        }
    }

    print("Calculator exiting.")
}


runCalculator()


// problem 10

func uniqueCharacter(_ text: String) -> Bool{
    var charSet = Set<Character>()
    
    for char in text {
        if charSet.contains(char){
            return false;
        }
        else{
            charSet.insert(char)
        }
    }
    
    return true;
}

let text1 = "Swift"
let text2 = "Java"

print(uniqueCharacter(text1))
print(uniqueCharacter(text2))
