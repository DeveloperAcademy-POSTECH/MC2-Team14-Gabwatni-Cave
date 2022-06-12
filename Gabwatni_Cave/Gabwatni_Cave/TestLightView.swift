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
    
    @State private var presentView: Bool = false
    @State private var showingImage: String = ""
    
    let size = UIScreen.main.bounds
    
    var body: some View {
      let distance = sqrt((dragOffset.width) * (dragOffset.width) + (dragOffset.height) * (dragOffset.height))
       
//        let distance = sqrt((pow(dragOffset.width - 200, 2)) + pow(dragOffset.height - 200, 2))
        
        ZStack{
            Image("Twilight")
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
                    
                }    //함수
                     //온체인지가 함수를 입력값으로 받는 메소드
                .onEnded { gesture in
                    dragOffset = CGSize(width: gesture.translation.width + dragOffset2.width, height: gesture .translation.height + dragOffset2.height)
                    dragOffset2 = dragOffset
                    
                    print(distance)
                })
            
            if presentView {
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                    ItemDetailView(imageName: showingImage, isShowing: $presentView)
                        .frame(width: size.width, height: size.height)
                        //.position(x: size.width / 2, y: size.height / 2)
                }
                
            }

//            ShimmeringItemView(count: $count, isShowing: $presentView, imageName: "dongdal", degreeNum: 50, showingImage: $showingImage)
//                .position(x: 200, y: 200)
//                .frame(width: 50, height: 50)

            if distance <= sqrt(2) * 100 + 50 {
                ShimmeringItemView(count: $count, isShowing: $presentView, imageName: "dongdal", degreeNum: 50, showingImage: $showingImage)
                    .position(x: 200, y: 200)
                    .frame(width: 50, height: 50)
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


