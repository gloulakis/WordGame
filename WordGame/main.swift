//
//  main.swift
//  WordGame
//
//  Created by Georgios Loulakis on 8.02.22.
//

import Foundation

var isAppRunning = true
var isGameRunning = true

func welcomeMessage(){
    print("-------- Welcome to \"WordGame\" --------")
    print("Your task is to quess the provided word")
    print("        -> within 6 attemp(s) <-       ")
    print("     ")
    print("            GOOD LUCK!!!!!!")
}

func gameCommands(){
    print("----------                  -----------")
    print("Available commands: ")
    print("\ts - Start the game")
    print("\tq - Quit")
    print("----------------------")
}

func gameRules(){
    print("----------------------")
    print("- If you provide a letter, which exists in the word, and the position is correct, then the game will print your letter as a capital (uppercase) letter (\"A\")")
    print("- If you provide a letter, which exists in the word, but the position isn't correct, then the game will print your letter as a lowercase letter (\"a\")")
    print("- If you provide a letter, which does not exist in this word, your letter will be replaced with the underscore (\"_\").")
    print("----------------------")
}

//-----> Commands

enum Command:String{
    case s
    case q
    case eof
}

enum gameControle:String{
    case y
    case n
}

func readLine(after message: String) -> String{
    print(message, terminator: ": ")
    
    if let input = readLine() {
        return  input.trimmingCharacters(in: .whitespaces)
    } else {
        return "eof"
    }
}

func startGame (){
    print("!!!!!! You have 6 attempt(s) !!!!!!")
    gameRules()
    let pickAWord = words.randomElement()!
    
    while isGameRunning == true {
        let inputCommand = readLine(after: "Press - y to play or - n for start menu")
            
            guard let Gamecommand = gameControle.init(rawValue: inputCommand)else {
                print ("\(inputCommand): is not found")
                continue
            }
        switch Gamecommand {
        case .y:
            print(pickAWord)
            break
        case .n:
            isGameRunning = false
            print("///////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
            print("-----------------------------")
            welcomeMessage()
            gameCommands()
        }
    }
    print (pickAWord)
}

//-----> Main code here

welcomeMessage()
gameCommands()
var words = ["Apple","Samsung"]


while isAppRunning == true {
let inputCommand = readLine(after: "Enter command")
    
    guard let command = Command.init(rawValue: inputCommand)else {
        print ("\(inputCommand): is not found")
        continue
    }

switch command {
    
case .s:
    startGame()
    break
    
case .q,.eof:
    isAppRunning = false
    break
    
}
}

