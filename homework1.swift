import UIKit

class Human{
    var firstName:String = "Alibek";
    var lastName:String = "Baisholanov";
    var age:Int = 19;
    var birthYear:Int = 2004;
    var isStudent:Bool = true;
    var height:Double = 1.78;
    var currentYear:Int = 2024;
    var age_by_year:Int{
        return currentYear - birthYear
    }
    
    //second part
    var hobby:String = "LeetCode";
    var numberOfHobbies:Int = 5;
    var favouriteNumber:Int = 5;
    var isHobbyCreative:Bool = true;
    
    //bonus task
    var futureGoals👾:String = "In the future, I wanna be a happy😃"
}

var me: Human = Human()
let statusStudent = me.isStudent ? "I am student" : "I am not a student"
let statusCreativeHobby = me.isHobbyCreative ? "which is a creative hobby" : "which is not creative hobby"
var myStory:String = "My name is \(me.firstName). I am \(me.age) years old, born in \(me.birthYear). \(statusStudent). I enjoy \(me.hobby), \(statusCreativeHobby). I have \(me.numberOfHobbies) hobbies in total, and my favorite number is \(me.favouriteNumber). "

print(myStory + me.futureGoals👾)


