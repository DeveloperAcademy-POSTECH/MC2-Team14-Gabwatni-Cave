//
//  TwilightView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct TwilightView: View {
    @State private var count: Int = 0
    @State private var maxCount: Int = 2
    
    let size: CGRect = UIScreen.main.bounds
    
    private var zoneText: String = "Twilight Zone"
    private var zoneDescribe: String = "빛과 어둠이\n 만나는 곳"
    
    @State private var isFirst: Bool = true
    
    @State private var presentView: Bool = false
    @State private var showingImage: String = ""

    @State private var testRender: Bool = false
    
    var body: some View {
        ZStack{
            Image("twillight-edit")
                .ignoresSafeArea()
                .onTapGesture{
                    testRender.toggle()
                }
            
           // TestLightView()
           
            NextStageButtonView(destinationView: Abyss(), count: $count, nextCount: $maxCount, isShowing: $presentView)
                .position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height / 2)
                
            
            ShimmeringItemView(count: $count, isShowing: $presentView, imageName: "salamander", degreeNum: 50, showingImage: $showingImage)
                .frame(width: 500, height: 500)
                .position(x: 100, y: 100)
            
            ShimmeringItemView(count: $count, isShowing: $presentView, imageName: "minigame dragon", degreeNum: 180, showingImage: $showingImage)
                .frame(width: 50, height: 50)
                .position(x: 200, y: 200)
            
            if presentView {
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                    ItemDetailView(imageName: showingImage, isShowing: $presentView)
                        .frame(width: size.width, height: size.height)
                }
            }
            
           // 진입하면 나오는 view
            ZStack{
                Image("light and darkness meet")
                    .ignoresSafeArea()
                VStack{
                    Text(zoneText)
                        .font(.title3)
                        .foregroundColor(.white)
                    Text(zoneDescribe)
                        .kerning(5)
                        .lineSpacing(10)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isFirst.toggle()
                }
            }
            .opacity(isFirst ? 1 : 0)
            .animation(.easeIn, value: isFirst)
        }
    }
}
