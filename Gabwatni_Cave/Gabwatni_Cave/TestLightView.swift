//
//  TestLightView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

// MARK: - 사용 설명
// 1. dragOffset과 dragOffset2 프로퍼티를 가져가세요.
// 2. distance 프로퍼티를 가져가서 body 프로퍼티 내부로 가져가세요.
// 3. body 프로퍼티 내부의 ZStack을 원하는 뷰 내부의 ZStack 내부로 넣으면 알맞게 작동합니다.

struct TestLightView: View {
    @State var dragOffset = CGSize.zero
    @State var dragOffset2 = CGSize.zero
    
    @State var count: Int = 0
    
    @State private var presentView: Bool = false
    @State private var showingImage: String = ""
    
    let size = UIScreen.main.bounds
    
    var body: some View {
        // 상호작용 물체와의 거리 계산
        let distance = sqrt((pow(dragOffset.width - 200, 2)) + pow(dragOffset.height - 300, 2))
        
        ZStack {
            Image("horror of the abyss")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .scaledToFit()
                .ignoresSafeArea()
            
            RadialGradient(
                gradient: Gradient(colors: [Color(0xFFFFFF, alpha: 0.1), Color(0x000000, alpha: 1)]),
                center: .center,
                startRadius: -50,
                endRadius: 150
            )
            .frame(width: 10000, height: 10000)
            .offset(x: dragOffset.width , y: dragOffset.height)
            .gesture(DragGesture()
                .onChanged { gesture in
                    dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
                    
                }
                     //함수
                     //온체인지가 함수를 입력값으로 받는 메소드
                .onEnded { gesture in
                    dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
                    dragOffset2 = dragOffset
                    
                    print(distance)
                })
            
            // 거리 <= 루트(상호작용 물체의 프레임/2) + 손전등 반지름(100)
            if distance <= sqrt(2) * 75 + 100 {
                Image("minigame dragon")
                    .resizable()
                    .position(x: 200, y: 300)
                    .frame(width: 150, height: 300)
            }
        }
        
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct TestLightView_Previews: PreviewProvider {
    static var previews: some View {
        TestLightView()
    }
}


