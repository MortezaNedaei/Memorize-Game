//
//  ContentView.swift
//  Memorize
//
//  Created by MoNe on 10/16/1399 AP.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CardGameViewModel
    
    var body: some View {
        NavigationView {
            HStack {
                ForEach (0..<viewModel.emojies.count) { index in
                    CardView(card: self.viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        self.viewModel.select(card: self.viewModel.cards[index])
                    }
                }
            }.padding()
            .navigationBarTitle(Text("Score:").font(.title))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CardGameViewModel())
    }
}

/**
 CardView
 */
struct CardView: View {
    var card : CardModel
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 16.0)
                        .strokeBorder(Color.orange,lineWidth: 2)
                    Text(card.emoji)
                        .font(
                            Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
                        .foregroundColor(.white)
                        .padding()
                        
                } else {
                    RoundedRectangle(cornerRadius: 16.0)
                        .foregroundColor(.orange)
                }
                
            }.aspectRatio(0.75, contentMode: .fit)
        }
    }
}
