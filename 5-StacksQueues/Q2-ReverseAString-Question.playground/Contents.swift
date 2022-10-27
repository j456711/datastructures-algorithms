import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    // Do your work here...
    
    // Array 解法
    // 1. Turn text string into an array
    // 2. Reverse array
    // 3. Declare a variable called result with type String
    // 4. Loop through the reversed array and take the character out, and then add it to result

    // Edge cases:
    // 1. text is empty -> just return empty
    // 2. text only contains one character -> just return text
    
    // Time complexity: O(n)
    // Space complexity: O(n + m)
    
    guard !text.isEmpty else { return "" }
    guard text.count > 1 else { return text }
    
    let characters: [String] = text.map { "\($0)" }
    
    var reversedCharacters: [String] = []
    for character in characters {
        reversedCharacters.insert(character, at: 0)
    }

    var result: String = ""
    for character in reversedCharacters {
        result += character
    }
    
    return result
}

solution("")
solution("a")
solution("ab")
solution("abc") // bca
solution("Would you like to play a game?")

func solution1(_ text: String) -> String {
    // Do your work here...
    
    // Stack 解法
    // 1. Turn text string into a character array
    // 2. Reverse character array
    // 3. Loop through the count of the array, change charcter array by index to match with the last element of array
    // 4. Turn character array into string

    // Edge cases:
    // 1. text is empty -> just return empty
    // 2. text only contains one character -> just return text
    
    guard !text.isEmpty else { return "" }
    guard text.count > 1 else { return text }
    
    var characters: [Character] = Array(text)
    var copyCharacters = characters
    
    for index in 0 ..< characters.count {
        characters[index] = copyCharacters.popLast()!
    }
    
    return String(characters)
}

solution1("")
solution1("a")
solution1("ab")
solution1("abc") // bca
solution1("Would you like to play a game?")

func solution2(_ text: String) -> String {
    // Do your work here...
    
    // Array 解法（改良版）
    // 1. Turn text string into an array
    // 2. Declare a variable called result with type String
    // 3. Loop through the text count, take and remove the last element of array, and then add it to result

    // Edge cases:
    // 1. text is empty -> just return text
    // 2. text only contains one character -> just return text
    
    // Time complexity: O(n)
    // Space complexity: O(n)
    
    guard text.count > 1 else { return text }
    
    var characters: [Character] = Array(text)
    var result: String = ""
    
    for _ in 0 ..< text.count {
        let last = characters.popLast()!
        result.append(last)
    }
    
    return result
}

solution2("")
solution2("a")
solution2("ab")
solution2("abc") // bca
solution2("Would you like to play a game?")
