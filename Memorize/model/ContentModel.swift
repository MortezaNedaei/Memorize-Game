//
//  CardGameModel.swift
//  Memorize
//
//  Created by MoNe on 10/18/1399 AP.
//

import Foundation

struct ContentModel {
    
    var emojies = ["😐", "😂", "😜", "😳"]
    var cards = Array<CardModel>()
    
    init() {
        for index in 0 ... emojies.count - 1 {
            cards.append(CardModel(id: index, emoji: emojies[index]))
            cards.append(CardModel(id: index * 2 + 1, emoji: emojies[index]))
        }
    }
    
    mutating func select(card: CardModel) {
        let index = findIndex(card: card)!
        cards[index].isFaceUp.toggle()
    }
    
    private func findIndex (card: CardModel) -> Int? {
        if let index = cards.firstIndex(of: card) {
            print(index)
            return index
            
        }
        return nil
    }

    
}

struct CardModel : Identifiable, Equatable {
    var id = 0
    var isFaceUp = false
    var isMatched = false
    var emoji = ""
}
