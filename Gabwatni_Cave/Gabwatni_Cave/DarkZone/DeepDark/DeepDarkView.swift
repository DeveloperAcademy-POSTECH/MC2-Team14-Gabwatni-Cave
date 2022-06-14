//
//  DeepDarkView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct DeepDarkView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var str = "" //문장이 실제로 들어가야되는 곳
    @State var transparentSnailText = "어두운 곳에 생육하는 특성때문에 다른 달팽이보다 눈이 짧고 투명한 등껍질을 가지고 있다. 움직임이 거의 없고, 이동시에는 흐르는 물을 타고 이동한다." //넣고 싶은 문장
    @State var caveSalamanderText = "눈이 퇴화하여 피부 밑에 파붙혀 있고, 색소가 없는 피부가 특징이다. 자신의 신체를 분해하여 양분을 공급받고 불로불사할 수 있다."
    @State var count = 0
    @State var transparentSnail = false
    @State var caveSalamander = false
    @State var num = 0
    @State var transitionView = false
    @State var showSheet = false
    
    //@Binding var mainflow: Int
    var mainflow: Int
    @Binding var flow: Int
    //@State var transparentSnailText = false
    
    
    func ges(){
        str = ""
        let length = transparentSnailText.count
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            AudioServicesPlaySystemSound(1306)
            str += String(transparentSnailText[transparentSnailText.index(transparentSnailText.startIndex, offsetBy: index)])
            index+=1
            if index == length{
                timer.invalidate()
            }
        }
    }
    
    func ges2(){
        str = ""
        let length = caveSalamanderText.count
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            AudioServicesPlaySystemSound(1306)
            str += String(caveSalamanderText[caveSalamanderText.index(caveSalamanderText.startIndex, offsetBy: index)])
            index+=1
            if index == length{
                timer.invalidate()
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                NextStageImageView(image: "deepDark")
                ShimmeringItemView2(imageName: "transparent snail", degreeNum: 50,toggle: $transparentSnail)
                    .frame(width: 100, height: 100)
                    .position(x: 100, y: 100)
                    .onTapGesture {
                        //ges()
                        transparentSnail.toggle()
                    }.opacity(transparentSnail ? 0 : 1)
                
//                if transparentSnail{
//                    textBox(name: transparentSnail ? "투명 달팽이" : "", text: str)
//                }
                
                
                ShimmeringItemView3(imageName: "minimap", degreeNum: 50,toggle: $caveSalamander)
                    .frame(width: 100, height: 100)
                    .position(x: 200, y: 200)
                    .onTapGesture {
                        //ges2()
                        caveSalamander.toggle()
                    }.opacity(caveSalamander ? 0 : 1)
                
                
                
                Button{
                    showSheet.toggle()
                } label: {
                    Image("minimap")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView(image: "minimap", myPosition: "현재위치: 칠흑의 방")})
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment:.topTrailing)
                .padding()
                
                CardView(imageName: "salamander", cardState: $caveSalamander)
                    .onDisappear {
                        count += 1
                    }
                CardView(imageName: "transparent snail", cardState: $transparentSnail)
                    .onDisappear {
                        count += 1
                    }
                
                
                if count == 2 {
                    Button{
                        withAnimation(.easeIn) {
                            vm.flow = 4
                        }
                    }label: {
                        Image("footprint")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .foregroundColor(.white)
                    }
                    .position(x: 300, y: 700)
                }
            }
            
            
            
        }
    }
}


struct ShimmeringItemView2: View {
    // @EnvironmentObject var data : dataModel
    
    @State private var isViewing: Bool = true
    
    private(set) var imageName: String
    private(set) var degreeNum: Double
    @Binding var toggle : Bool
    var body: some View {
        Image(imageName)
            .shimmered(degreeNum: degreeNum)
    }
}

struct ShimmeringItemView3: View {
    // @EnvironmentObject var data : dataModel
    
    @State private var isViewing: Bool = true
    
    
    private(set) var imageName: String
    private(set) var degreeNum: Double
    @Binding var toggle : Bool
    var body: some View {
        Image(imageName)
            .shimmered(degreeNum: degreeNum)
        
    }
}
