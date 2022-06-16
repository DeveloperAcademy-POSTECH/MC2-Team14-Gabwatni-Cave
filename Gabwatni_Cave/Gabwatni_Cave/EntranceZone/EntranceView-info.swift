//
//  EntranceView-info.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI

struct EntranceView_info: View {
    @Binding var flow : Int
    @ObservedObject var cardVM = CardViewModel()
    @State var state = true
    
    var body: some View {
        ZStack {
            Image("deepDark-edit")
            CardView(imageName: "stalactite", cardState: $state)
                .onDisappear(){
                    flow = 3
                }
           
            Text("카드를 터치해 뒤집어 보세요!")
                .font(.custom("Sam3KRFont", size: 20))
                .frame(width: 300, height: 50, alignment: .center)
                .foregroundColor(.white)
                .position(x: UIScreen.main.bounds.width/2
                          , y: UIScreen.main.bounds.height/15 * 2)
            
        }
    }
}


struct entranCardView: View {
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
                
            } label: {
                Text("다음")
            }
            
        }
    }
}
