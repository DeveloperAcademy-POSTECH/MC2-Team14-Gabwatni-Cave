//
//  CardView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    @ObservedObject var vm = CardViewModel2()
    @State private var shineTirgger = false
    @Binding var cardState: Bool
    
    var body: some View {
        if cardState {
        ZStack {
            Color.black
                .opacity(0.8)
                .ignoresSafeArea()

            Button {
                cardState.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    
            }
            .position(x: UIScreen.main.bounds.width/2
                        , y: UIScreen.main.bounds.height/40)
            
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 345, height: 450, alignment: .center)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .foregroundColor(Color(0xDFDFDF))

                    VStack {
                        Text(vm.imageTitle)
                            .font(.custom("Sam3KRFont", size: 30))
                            .foregroundColor(.black)
                            .padding()
                        
                        Image("real " + "\(vm.imageName)")
                            .resizable()
                            .cornerRadius(10)
                            .opacity(0.9)
                            .frame(width: 300, height: 340, alignment: .center)

                    }
                }
                .onTapGesture {
                    shineTirgger.toggle()
                }
                .shineEffect(animationTrigger: $shineTirgger)
                .position(x: UIScreen.main.bounds.width/2
                          , y: UIScreen.main.bounds.height/2.7)
            

            textBox(name: vm.imageTitle, text: vm.inputString)
                .onAppear {
                    vm.loadCardData(imageName: imageName)
                    vm.talkOnTextBox(stringArray: vm.imageText, inputIndex: vm.stringArrayIndex)
                }
            
            if vm.textEnd {
                Button{
                    vm.talkOnTextBox(stringArray: vm.imageText, inputIndex: vm.stringArrayIndex)
                } label:{
                Text("다음")
                    .font(.custom("Sam3KRFont", size: 20))
                    .foregroundColor(.white)
                
            }
            .position(x: UIScreen.main.bounds.width/8 * 6
                      , y: UIScreen.main.bounds.height/13 * 11)
                
            }
            
            
//            ZStack{
//                Image("textbox")
//                    .resizable()
//                    .frame(width: 330, height: 150)
//
//
//                Text((CardData[imageName] ?? ["no title", "no text"])[1])
//                    .font(.custom("Sam3KRFont", size: 20))
//                    .foregroundColor(.white)
//                    .frame(width: 300, height: 250, alignment: .center)
//            }
//            .position(x: UIScreen.main.bounds.width/2
//                      , y: UIScreen.main.bounds.height/10 * 7.7)
//
            

        }
        }

    }
}
