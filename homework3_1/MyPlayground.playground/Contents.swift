import UIKit

var word: String = "example";
var count: Int = 0;

for i in word {
    if (i == "a" || i == "e" || i == "i" || i == "u"){
        count+=1;
    }
}

print(count)
