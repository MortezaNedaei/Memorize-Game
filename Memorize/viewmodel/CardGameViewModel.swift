//
//  CardGameViewModel.swift
//  Memorize
//
//  Created by MoNe on 10/18/1399 AP.
//

import Foundation

final class CardGameViewModel : ObservableObject {
    
    @Published private var contentModel = ContentModel()
    
    var cards: Array<CardModel> {
        contentModel.cards
        //contentModel.cards.shuffled()
    }
    
    var emojies: Array<String> {
        contentModel.emojies
    }
    
    func select(card: CardModel) {
        contentModel.select(card: card)
    }
    
}
