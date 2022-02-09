//
//  main.swift
//  WordGame
//
//  Created by Georgios Loulakis on 8.02.22.
//

import Foundation

var isAppRunning = true
var StartGameRunning = true
var GammingRunning = true

func welcomeMessage(){
    print("  ")
    print(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ")
    print("  ")
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

struct searchWords{
    var systemWord: String
    var playerWord: String
    
    init(systemWord: String, playerWord:String){
        self.systemWord = systemWord
        self.playerWord = playerWord
    }
    
    func gameResult(){
       print(systemWord)
    }
}

func searchWord(){
    let systemWord = ["Apple","Samsung","Xiaomi"]
    let randomSystemWord:String = systemWord.randomElement()!
    var count:Int = 0
    print(randomSystemWord)
    let playerWord = readLine(after: "Word")
    
    while count < 6 {
        if playerWord.isEmpty == false && playerWord.count == randomSystemWord.count {
            print("Done")
        } else {
            print("Word is Empty or wrong, please try again!")
            print("\(playerWord.count) & \(randomSystemWord.count)")
        }
    }
    
    
}

func startGame (){
    gameRules()
    let words = ["Dani","Giorgos","Alex"]
    let pickAWord = words.randomElement()!
    print(pickAWord.count)
    
    while StartGameRunning == true {
            let inputCommand = readLine(after: "Press - y to play or - n for start menu")
            guard let Gamecommand = gameControle.init(rawValue: inputCommand)else {
                print ("\(inputCommand): is not found")
                continue
            }
        switch Gamecommand {
        case .y:
            
            break
        case .n:
            StartGameRunning = false
            welcomeMessage()
            gameCommands()
            break
        }
    }
}

//-----> Main code here

welcomeMessage()
gameCommands()

while isAppRunning == true {
    
let inputCommand = readLine(after: "Enter command")
    guard let command = Command.init(rawValue: inputCommand)else {
        print ("\(inputCommand): is not found")
        continue
    }

switch command {
    
case .s:
    searchWord()
    break
    
case .q,.eof:
    isAppRunning = false
    break
    
}
}

