//
//  WordList.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-30.
//

import LoremSwiftum
import Foundation

class WordCollection {
  var words: [Word]
  
  init(numWords: Int) {
    words = []
    for _ in 0..<numWords {
      let name = Lorem.word
      let word = Word(name: name)
      words.append(word)
    }
  }
}
