//
//  ItemDetailView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/11.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var twilightData: TwilightModel
    
    let imageName: String
    @Binding var isShowing: Bool
    
    @State private var shineTirgger = false
    //@Binding var cardState: Bool
    
    var body: some View {
        ZStack{
            VStack{
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
                        
                        Image("real " + "\(imageName)")
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
            }
//            VStack(spacing: 10){
//                Image(imageName)
//                    .shimmered(degreeNum: 30)
//                    .opacity(isShowing ? 1 : 0)
////                    .onTapGesture {
////                        isShowing = false
////                    }
//
//                Text(itemTitle ?? "err")
//                    .font(.title)
//                    .foregroundColor(.white)
//            }
            
            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    
            } .position(x: UIScreen.main.bounds.width/2
                        , y: UIScreen.main.bounds.height/38)
            
            newTextBox(StrArr: itemData!, charArr: ["도룡뇽", "도룡뇽", " "])
            
        }
        .onTapGesture {
            isShowing = false
        }
        
    }
    
}
