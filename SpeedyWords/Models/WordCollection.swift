//
//  WordCollection.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-30.
//

import Foundation

class WordCollection {
    var words = [Word(name: "tv"), Word(name: "cola"), Word(name: "spiderman"), Word(name: "superman"), Word(name: "python")]
    init() {
        // Randomize the words, no need to delete words than has been already used
        // Since we will increment index and never get same word twice
        words.shuffle()
    }
    
    var count : Int {
        return words.count
    }

    func getCurrentWord(at index: Int) -> String {
        guard index >= 0 && index < words.count else {
            return ""
        }
        return words[index].name
    }
}
