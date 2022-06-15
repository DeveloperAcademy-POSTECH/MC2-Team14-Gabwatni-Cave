//
//  Abyss.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI

struct Abyss: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var abyssView = true
    
    @State var isBoss: Bool = false
    
    let size = UIScreen.main.bounds
    
    private var zoneText: String = "Dark Zone"
    private var zoneDescribe: String = "심연의 공포"
    
    @State var presentView: Bool = false
    @State var showingImage: String = ""
    
    @State private var isFirst: Bool = true
    
    // 손전등 관련 변수들
//    @State var dragOffset = CGSize.zero
//    @State var dragOffset2 = CGSize.zero
    
    var body: some View {
//        let distance = sqrt((pow(dragOffset.width - 200, 2)) + pow(dragOffset.height - 300, 2))
        
        // 심연의 공포 뷰
        if abyssView {
            ZStack {
                Image("abyss")
                    .resizable()
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .scaledToFit()
                    .ignoresSafeArea()
                
                if !presentView || !abyssView {
                    LightView()
                        .onAppear{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                if vm.itemDict["water"]! && vm.itemDict["cavecoral"]! {
                                    //
                                    
                                    withAnimation(.easeIn(duration: 1.5)){
                                        
                                        isBoss = true
                                    }
                                }
                            }
                        }
                }
                
                
                LightItemView(thisPositionX: 50, thisPositionY: 300, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "water")
                
                LightItemView(thisPositionX: -75, thisPositionY: -200, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "cavecoral")
                
                
                if presentView {
                    CardView(imageName: "bat", cardState: $presentView)
                        .padding(.top, 40)
                    
                }
           
                    
//  Group{
//                LightItemView(thisPositionX: -50, thisPositionY: 300, thisFrameWidth: 100, thisFrameHeight: 150, isShowing: $presentView, imageName: "circle", showingImage: "cavecoral")
//                RadialGradient(
//                    gradient: Gradient(colors: [Color(0xFFFFFF, alpha: 0.1), Color(0x000000, alpha: 1)]),
//                    center: .center,
//                    startRadius: -50,
//                    endRadius: 150
//                )
//                .frame(width: 10000, height: 10000)
//                .offset(x: dragOffset.width , y: dragOffset.height)
//                .gesture(DragGesture()
//                    .onChanged { gesture in
//                        dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
//
//                    }
//                         //함수
//                         //온체인지가 함수를 입력값으로 받는 메소드
//                    .onEnded { gesture in
//                        dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
//                        dragOffset2 = dragOffset
//
//                        print(distance)
//                    })
//
//                if distance <= sqrt(2) * 30 + 100 {
//                    Image("dragonmillipede")
//                        .resizable()
//                        .position(x: 200, y: 300)
//                        .frame(width: 75, height: 150)
//                        .onTapGesture {
//                            abyssView = false
//                        }
//                }
//   }
                QuizView(quizModel: QuizModel())
                        .onAppear{
                            playSound(sound: "Action_Hero", type: ".mp3")
                        }
                        .opacity(isBoss ? 1 : 0)
                
                
                
                // 진입하면 나오는 view
                ZStack {
                    Image("horror of the abyss")
                        .ignoresSafeArea()
                    VStack{
                        Text(zoneText)
                            .font(.custom("Sam3KRFont", size: 28))
                            .foregroundColor(.white)
                        Text(zoneDescribe)
                            .kerning(5)
                            .lineSpacing(10)
                            .font(.custom("Sam3KRFont", size: 42))
                            .foregroundColor(.white)
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        isFirst.toggle()
                    }
                }
                .opacity(isFirst ? 1 : 0)
                .animation(.easeIn, value: isFirst)
            }
            
         
        }
        // 드래곤 밀리패드 누르면 퀴즈 뷰로 넘어감
//        else { QuizView(quizModel: QuizModel())
//                .onAppear{
//                    playSound(sound: "Action_Hero", type: ".mp3")
//                }
//        }
    }
}

struct Abyss_Previews: PreviewProvider {
    static var previews: some View {
        Abyss()
    }
}
