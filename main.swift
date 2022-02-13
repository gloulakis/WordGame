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
var words = ["Car","Orange","Ten","Five","Give"]
let pickAWord = words.randomElement()!
var playersWord = ""

// -----> Welcome Message & Rules

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

enum mainCommand:String{
    case s
    case q
    case eof
}

enum gameCommand:String{
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

//------> Game
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

func startGame (){
    gameRules()
    var count = 1
    let wordCounter = 1
    var pickWordIndex:Int = 1
    var playerWordIndex:Int = 1
    var wordList:[Any] = []
    print("Guess the word: ")
    for _ in pickAWord {
        print("_",terminator: " ")
    }
    print("")
    print("")
    while GammingRunning == true && count <= 6{
        wordList.removeAll()
        playersWord = readLine(after: " \(count) Attemp Word ")
        let trimWord = playersWord.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let pickWordLcased = pickAWord.lowercased()
        let playerWordLcased = trimWord.lowercased()

        if pickWordLcased.elementsEqual(playerWordLcased) {
                print ("You win!")
                playAgain()
                break
            }
        if trimWord.count < pickAWord.count {
            print("The word must be \(pickAWord.count) characters please try again!")
        }
        if pickWordLcased != playerWordLcased && wordCounter <= pickWordLcased.count {
            for t in playerWordLcased  {
                for p in pickWordLcased{
                    if p == t && pickWordIndex == playerWordIndex {
                        wordList.append(p.uppercased())
                        break
                    } else if p == t && pickWordIndex != playerWordIndex {
                        wordList.append(p.lowercased())
                    }
                    playerWordIndex+=1
                }
            }
            wordList.append("_")
            pickWordIndex = 0
            playerWordIndex = 0
            for i in 0...wordList.count-1 {
                print ( wordList[i],terminator: "")
            }
            print ("")
        }
        if count == 6 {
            print("")
            print("Game Over! You have only 6 Attemps!!")
            print("")
            playAgain()
        }
        count+=1
    }
    
}

func playAgain (){
    while true {
        let inputCommand = readLine(after: "Do you want to play again? press -y for yes or -n to main menu")
            guard let command = gameCommand.init(rawValue: inputCommand)else {
                print ("\(inputCommand): is not found")
                continue
            }
        switch command {
        case .y:
            startGame()
        case .n:
            gameCommands()
            appRunning()
            break
        }
        break
    }
}

func appRunning (){
    while isAppRunning == true {
        
    let inputCommand = readLine(after: "Enter command")
        guard let command = mainCommand.init(rawValue: inputCommand)else {
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
        break
    }
}



//-----> Main

welcomeMessage()
gameCommands()
appRunning()
