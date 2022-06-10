//
//  CardView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var cardVM = CardViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            VStack {
                Text(cardVM.cards[0].title)
                    .foregroundColor(.white)
                Text(cardVM.cards[0].imageName)
                    .foregroundColor(.white)
                Text(cardVM.cards[0].text)
                    .foregroundColor(.white)
            }
            
            Button {
                print(cardVM.cards[0].title)
            } label: {
                Text("Button")
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
