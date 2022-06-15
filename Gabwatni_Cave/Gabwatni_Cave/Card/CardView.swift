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
    @State private var isFlipped = false
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @Binding var cardState: Bool
    let durationAndDelay : CGFloat = 0.3
    var alpha: Double = 1.0
    
    var body: some View {
        if cardState {
            ZStack {
                // 카드 뷰 배경
                Color.black
                    .opacity(alpha)
                    .ignoresSafeArea()
                    .offset(y: -40)
                
                ZStack {
                    CardFront
                    CardBack
                }
                .onTapGesture {
                    flipCard ()
                }
                
                .position(x: UIScreen.main.bounds.width/2
                          , y: UIScreen.main.bounds.height/10 * 4)
                
                
                // 카드 외부 텍스트 박스
                textBox(name: "", text: vm.inputString)
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
//                    .position(x: UIScreen.main.bounds.width/16 * 13
//                              , y: UIScreen.main.bounds.height/15 * 13)
                    .position(x: UIScreen.main.bounds.width/16 * 13
                              , y: UIScreen.main.bounds.height/15 * 13)
                    
                }
                
            }
            .offset(y: 40)
        }
    }
    
    private var CardFront: some View {
        ZStack {
            // 카드 프레임 (Card Frame)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 310, height: 450, alignment: .center)
                .shadow(color: .black.opacity(0.5), radius: 4, x: 10, y: 10)
                .foregroundColor(Color(0xDFDFDF))
                .padding()
            
            // 카드 제목
            VStack(spacing: 5) {
                Text(vm.imageTitle)
                    .font(.custom("Sam3KRFont", size: 28))
                    .foregroundColor(.black)
                    .padding()
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 362)
                        .foregroundColor(.gray)
                    Image("\(vm.imageName)")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.9)
                        .frame(width: 260, height: 342)
                }
            }
            
            Button {
                cardState.toggle()
            } label: {
                Text("x")
                    .font(.custom("Sam3KRFont", size: 28))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
            }
            .position(x: UIScreen.main.bounds.width/20 * 16.7
                      , y: UIScreen.main.bounds.height/20 * 4.3 + 45)
        }
        .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
    }
    
    private var CardBack: some View {
        ZStack {
            // 카드 프레임 (Card Frame)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 310, height: 450, alignment: .center)
                .shadow(color: .black.opacity(0.5), radius: 4, x: 10, y: 10)
                .foregroundColor(Color(0xDFDFDF))
                .padding()
            
            
            VStack(spacing: 5) {
                // 카드 제목
                Text(vm.imageTitle)
                    .font(.custom("Sam3KRFont", size: 28))
                    .foregroundColor(.black)
                    .padding()
                
                // 카드 이미지
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 362)
                        .foregroundColor(.gray)
                    Image("real " + "\(vm.imageName)")
                        .resizable()
                        .opacity(0.9)
                        .frame(width: 260, height: 342)
                }
            }
            
            Button {
                cardState.toggle()
            } label: {
                Text("x")
                    .font(.custom("Sam3KRFont", size: 28))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
            }
            .position(x: UIScreen.main.bounds.width/20 * 16.7
                      , y: UIScreen.main.bounds.height/20 * 4.3 + 45)
        }
        .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
    }
    
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        }
    }
}
