// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// case sensitive
var hi = "hi"
let HI = "HI"
let hI = "hI"

// specify variable type
var itsInteger:Int = 12

// assign error occur
// itsInteger = 3.0

var itsString: String = "Text:"
var itsFloat:Float = 3.0
itsFloat = 4.3;

// typecast : Float -> Int
itsInteger = Int(3.0)

// typecast : Int -> String
itsString = String(100)

// join String
var appleStr:String = "Apple"
var computerStr:String = "Computer"

"\(appleStr)\(computerStr)"
appleStr + computerStr

// array
var fruits = ["apple", "grape", "orange"]
var items = ["apple", 1, ["grape", "orange"]]

// Dictionary
var numberDic = ["one":1, "two":2, "three":3]


// for
for var i = 0; i < fruits.count; i++
{
    fruits[i]
}

for fruit in fruits
{
    fruit
}

for fruit in 0...fruits.count-1
{
    fruit
}

// if else
var number = 30
let hundred = 100

if number > hundred
{
    "number is over \(hundred)"
} else {
    "number is under \(hundred)"
}


// switch
var string = "hi"

switch string
{
    case "hi":
        "hi!!!!!!!!!!!"

    case "hello":
        "hello!!!"
    
    default:
        "bye"
}



func sumOf(paramOne:Int, paramTwo:Int) -> Int
{
    return paramOne + paramTwo
}

sumOf(10, 20)

func sumOfParams(params:Int...) -> Int
{
    var result = 0;
    for param in params
    {
        result = result + param;
    }
    
    return result;
}

sumOfParams(10, 20, 30)


func stringInfo(param: String) -> (content: String, length: Int)
{
    return (param, param.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
}

let engStringInfo = stringInfo("testString")
engStringInfo.length
engStringInfo.content

let korStringInfo = stringInfo("테스트문자열")
korStringInfo.length
korStringInfo.content

func castNumberWithAnyObject(param: Int) -> (AnyObject, AnyObject, AnyObject)
{
    return (Bool(param), Float(param), String(param))
}

let resultForCast = castNumberWithAnyObject(20)

func castNumber(param: Int) -> (boolValue: Bool, floatValue:Float, stringValue:String)
{
    return (Bool(param), Float(param), String(param))
}

let resultForCastAnyObject = castNumber(20)

resultForCastAnyObject.stringValue
resultForCastAnyObject.boolValue
resultForCastAnyObject.floatValue

let myInfo = [
    "name" : "typoon",
    "age" : "unknown",
    "gender" : "male",
    "girlFriend" : "anna"
]

myInfo["name"]

let girlFriend: String? = myInfo["girlFriend"]

if girlFriend
{
    let her = girlFriend!
    println("Your girl friend is \(her)")
} else {
    println("You don't have any girl friend")
}

if let her = myInfo["girlFriend"]
{
    println("Your girl friend is \(her)")
} else {
    println("You don't have any girl friend")
}


