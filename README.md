WordGame
Homework
„WordGame“ is a macOS Command Line Tool, which allows users to play a game where the user must try to guess the word.
Your task is to create this application.
Deadline:
Available in the Moodle.
Game flow (requirements)
● Application needs to have a list of predefined words - nouns (with identical length would be preferable).
● When starting the application, it must print out a welcome message and the rules. This must happen only once at the application startup.
Be smart, provide dynamic data in the text where possible.
 --- WordGame ---
Welcome to "WordGame", your task is to guess the provided word
within 6 attempt(s).
Rules:
- If you provide a letter, which exists in the word, and the
position is correct, then the game will print your letter as a
capital (uppercase) letter ("A")
- If you provide a letter, which exists in the word, but the
position isn't correct, then the game will print your letter as a
lowercase letter ("a").
- If you provide a letter, which does not exist in this word,
your letter will be replaced with the underscore ("_").
--- Good luck! —
● Attempt count must be easily configurable, that means, we should be able to change it in the code only in one place and the game must adapt to it on the next launch.
● When the guessing round starts, the application must randomly choose one of the predefined words - this will be the word, which the user will try to guess.
● Then the application must print out a message: Guess the word!
    You have 6 attempt(s).
● Then the first turn starts, and the game prints out the guessing word characters as the underscores
_____
● After that the game waits for the user to provide a word (or random letters, it's up to the user) and then the turn ends:
swift
● On the next turn, the game prints out the word in a combination with your provided letters, if any of provided letters exist in the guessing word:
s____
Rules for the print-out:
1. If the provided letter exists in the word and the letter position is correct, then the letter must be printed out in capital (uppercase) style (“S”).
2. If the provided letter exists in the word but the letter position is not correct, then the letter must be printed out in lowercase style (“s”).
3. If the provided letter does not exist in the word, the game prints out the underscore for that letter position (“_”).
● After that the game again waits for the user to provide a word and then the turn ends: brush
● On the next turn, the game again prints out the word in a combination with your provided letters, if any of provided letters exist in the guessing word:
__USh
● The game continues to take turns till the point when the user guesses the word or the user runs out of allowed attempts...
● In situation where the user guesses the word, the application print out the word all in uppercase letters and also prints out a congratulations message:
Explanation of the lines:
The first line is the user input, the second line is the printed out word (just by following the
      house
 HOUSE
 Congratulations! You guessed the word with 3 attempt(s).
 
 previously mentioned game rules for the print-out - when the turn begins) and the third line
is the game output in case the user guessed the word.
● In situation where the user runs out of the attempts, the application prints out a failure
message:
Explanation of the lines:
The first line is the user input, the second line is the printed out word (just by following the previously mentioned game rules for the print-out - when the turn begins) and the third line is the game output in case the user runs out of the attempts.
● When the round ends (in case the user wins on not), the game asks to if the user wants to play again:
   Play again? y - yes, n - no
If the user provides “y” then a new round begins. If the user provides “n” then the game quits. (see gameplay example).
● Keep the code clean - remove unused or unnecessary code lines, add code comments where the code gets complicated, keep the project organized and clean, create your own functions where possible/ if needed and use them.
horse
 HO_SE
 Sorry, you ran out of attempts. The word was "HOUSE".
  
 Gameplay
  Additional
These are only additional tasks, to earn bonus points, in case you manage to finish the game development early.
● Create an additional command, which the user can provide when the round finishes (at the point when the user is asked to play again). This command could print out the user score - how many games the user has won and how many games has lost.
 
● Add functionality to not give the user to guess the same words again, which were already played.
Submission
Compress the final version of the whole project folder (including the .xcodeproj) and upload it in the Moodle.
