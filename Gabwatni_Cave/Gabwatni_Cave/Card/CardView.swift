//
//  CardView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    @State private var shineTirgger = false
    @Binding var cardState: Bool
    
    var body: some View {
        if cardState {
        ZStack {
            Color.black
                .opacity(0.8)
                .ignoresSafeArea()

                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 345, height: 470, alignment: .center)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .foregroundColor(Color(0xDFDFDF))

                    VStack {
                        Text((CardData[imageName] ?? ["no title", "no text"])[0])
                        //Text(vm.cards[index].title)
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.black)
                        
                        Image(imageName)
                        //Image("\(vm.cards[index].imageName)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 356, alignment: .center)

                    }
                }
                .onTapGesture {
                    shineTirgger.toggle()
                }
                .shineEffect(animationTrigger: $shineTirgger)
                .position(x: UIScreen.main.bounds.width/2
                          , y: UIScreen.main.bounds.height/2.7)
            

            ZStack{
                Image("textbox")
                    .resizable()
                    .frame(width: 330, height: 150)
                
                //ScrollView {
                Text((CardData[imageName] ?? ["no title", "no text"])[1])
                //Text("\(vm.cards[index].text)")
                    .font(.custom("Sam3KRFont", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 250, alignment: .center)
            }
            .position(x: UIScreen.main.bounds.width/2
                      , y: UIScreen.main.bounds.height/10 * 7.7)
            
            Button {
                cardState.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    
            } .position(x: UIScreen.main.bounds.width/2
                        , y: UIScreen.main.bounds.height/40)

        }
        }

    }
}
