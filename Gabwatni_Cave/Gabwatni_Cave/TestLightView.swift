//
//  TestLightView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct TestLightView: View {
    @State var dragOffset = CGSize.zero
    @State var dragOffset2 = CGSize.zero
    
    @State var count: Int = 0
    
    var body: some View {
        let distance = sqrt((dragOffset.width) * (dragOffset.width) + (dragOffset.height) * (dragOffset.height))
        
        ZStack{
//            Image("Twilight")
//                .resizable()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//                .scaledToFit()
//                .ignoresSafeArea()
//
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
                    
                }    //함수
                     //온체인지가 함수를 입력값으로 받는 메소드
                .onEnded { gesture in
                    dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
                    dragOffset2 = dragOffset
                    
                    print(distance)
                })
            
            // stem 씨 살려줘용
            if distance > 0 {
                ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 40)
                    .frame(width: 50, height: 50)
            }
            
//            Button {
//                print(distance)
//                print("aa")
//            } label: {
//                // distance에 맞게 요소 위치를 주면 어느정도 해결 가능할지도
//                //                if distance <= sqrt(2) * 50 {
//                //                    ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 50)
//                //                        .frame(width: 50, height: 50)
//                //                }
//                //
//                if distance < 220 || distance > 150 {
//                    ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 40)
//                        //.position(x: 200, y: 100)
//                        .frame(width: 50, height: 50)
//
//                }
//            } .position(x: 200, y: 100)
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


