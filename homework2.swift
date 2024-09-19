import UIKit

var fruits:[String] = ["bananas", "apple", "some kind of fruit", "avocado"]
print(fruits[2])


var myFavouriteNumbers: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8]
myFavouriteNumbers.insert(255)
print(myFavouriteNumbers)

var releasedDateOfLanguages: Dictionary<String, Int> = ["Swift" : 2014, "Python" : 1991, "C++" : 1979]
print(releasedDateOfLanguages["Swift"]!)


var colors: [String] = ["blue", "white", "orange"]
colors[1] = "red"
print(colors)

//------------Medium part------------------

var firstSet: Set<Int> = [1, 2, 3, 4]
var secondSet: Set<Int> = [3, 4, 5, 6]
let intersection = firstSet.intersection(secondSet)
print(intersection)



var scores: Dictionary<String, Double> = [
    "Arman" : 2.99,
    "Egor" : 2.98,
    "Alisher" : 3.22
]
scores["Egor"] = 2.94
print(scores)



var fruits1:[String] = ["bananas", "apple"]
var fruits2:[String] = ["cherry", "date"]
fruits1 += fruits2
print(fruits1)


//------------Hard part------------------

var countries: Dictionary<String, Int> = ["Kazakhstan" : 19620000, "Uzbekistan" : 35650000, "Tajikistan" : 9953000]
countries["USA"] = 333000000
print(countries)


var first: Set<String> = ["cat", "dog"]
var second: Set<String> = ["dog", "mouse"]
var result = first.union(second)
print(result.subtracting(second))



let studentGrades: [String: [Dictionary<String, Int>]] = [
    "Alice": [],
    "Bob": [["Math": 89],
            ["Science": 91],
            ["English": 85]],
    "Charlie": [["Math": 89],
                ["Science": 91],
                ["English": 85]]
]

if let grades = studentGrades["Bob"] {
    print(grades[0]["Math"]!)
}









