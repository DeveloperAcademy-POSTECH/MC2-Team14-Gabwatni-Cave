//
//  TwilightView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI


struct TwilightView: View {
    @State private var count: Int = 0
    @State private var maxCount: Int = 3
    
    private var zoneText: String = "Twilight Zone"
    private var zoneDescribe: String = "빛과 어둠이\n 만나는 곳"
    
    @State private var isFirst: Bool = true
    
    var body: some View {
        ZStack{
            Image("Twilight")
                .ignoresSafeArea()
            
            // 해결해야함
            // 배경은 보이는데 뒤 요소가 안보임
            // TestLightView()
            
            NextStageButtonView(destinationView: Abyss(), count: $count, nextCount: $maxCount)
                .position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height / 2)
            
            ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 50)
                .frame(width: 50, height: 50)
                .position(x: 100, y: 100)
            
            ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 50)
                .frame(width: 50, height: 50)
                .position(x: 300, y: 300)
            
            ShimmeringItemView(count: $count, imageName: "treasure chest", degreeNum: 50)
                .frame(width: 50, height: 50)
                .position(x: 150, y: 500)
            
            
            ZStack{
                Image("FirstTwilight")
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

struct TwilightView_Previews: PreviewProvider {
    static var previews: some View {
        TwilightView()
    }
}
