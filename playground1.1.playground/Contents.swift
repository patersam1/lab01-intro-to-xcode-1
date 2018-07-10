//: Playground - noun: a place where people can play

import Cocoa

import Foundation

/*
 * Checks a word for emoji match and returns
 * corresponding unicode.  If no emoji match found,
 * the word string is returned unchanged.
 *
 * @param: word - string to match with emoji
 *
 * @return: String - utf code for matched emoji
 *                   or the original string
 */
func emojicode(word: String) -> String {
    
    // Convert the characters in the string
    // to lowercase and check for emoji match
    switch word.lowercased() {
        
    case "beer":
        return "\u{1F37A}"
        
    case "television", "tv":
        return "\u{1F4FA}"
        
        // Switch statements must cover all the cases,
        // the default case is taken when no other
    // cases match
    default:
        return word
    }
}

/*
 * Prints a string replacing matched words with
 * corresponding emoji
 *
 * @param: str - display
 *
 * @return: String - argument string with some words replaced
 *                   with utf code for corresponding emojis
 */
func emojiate(str: String) -> String {
    // Break the string into separate
    // word tokens.  Start with the empty token
    var word: String = ""
    var result: String = ""
    
    // Iterate over every character in the string
    for char: Character in str {
        
        // Check the character...
        if(String(char) >= "A" && String(char) <= "z") {
            // If the next character is a letter, add it
            // to the word token
            word.append(char)
        } else {
            
            // If the next character is not a letter,
            // try to convert the last word token
            // to emoji and add it to result string
            // (in swift addition operator concatenates
            // string)
            result += emojicode(word: word)
            
            // Add the current non-letter character to
            // the result (swift doesn't allow addition
            // of Character to String, so use append
            // method of String to concatenate a Character)
            result.append(char)
            
            // Clear the word token
            word = ""
        }
    }
    // Add the last word token to the result string
    // (matching it with emoji if possible)
    result += emojicode(word: word)
    
    // Return the resulting string
    return result
}

// Define a string constant
let myString = "No TV and no beer make Homer something something."

// Convert it to emoji string
let emojiString = emojiate(str: myString);

// Print the emojiString
print(emojiString)
