//
//  DeepDarkView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct DeepDarkView: View {
    @State var str = "" //문장이 실제로 들어가야되는 곳
    @State var transparentSnailText = "어두운 곳에 생육하는 특성때문에 다른 달팽이보다 눈이 짧고 투명한 등껍질을 가지고 있다. 움직임이 거의 없고, 이동시에는 흐르는 물을 타고 이동한다." //넣고 싶은 문장
    @State var caveSalamanderText = "눈이 퇴화하여 피부 밑에 파붙혀 있고, 색소가 없는 피부가 특징이다. 자신의 신체를 분해하여 양분을 공급받고 불로불사할 수 있다."
    @State var count = 0
    @State var transparentSnail = false
    @State var caveSalamander = false
    @State var num = 0
    //    @State var transparentSnailText = false
    
    
    func ges(){
        str = ""
        let startTime = Date().timeIntervalSince1970
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
        let startTime = Date().timeIntervalSince1970
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
            if num == 0 {
                ZStack{
                    NextStageImageView(image: "deepDark")
                    ShimmeringItemView2(imageName: "transparent snail", degreeNum: 50,toggle: $transparentSnail)
                        .frame(width: 100, height: 100)
                        .position(x: 100, y: 100)
                        .onTapGesture {
                            ges()
                            transparentSnail.toggle()
                            count = count + 1
                        }.opacity(transparentSnail ? 0 : 1)
                    if transparentSnail{
                        textBox(name: "투명 달팽이", text: str)
                    }
                    
                    ShimmeringItemView3(imageName: "minimap", degreeNum: 50,toggle: $caveSalamander)
                        .frame(width: 100, height: 100)
                        .position(x: 200, y: 200)
                        .onTapGesture {
                            ges2()
                            caveSalamander.toggle()
                            count = count + 1
                        }.opacity(caveSalamander ? 0 : 1)
                    if caveSalamander{
                        textBox(name: "동굴 도롱뇽", text: str)
                    }
                    if count == 2 {
                        Button{
                            num = num + 1
                        }label: {
                            Text("다음 스테이지로")
                        }
                    }
                    InventoryView(image: "minimap")
                }
            }
            else if num == 1{
                NextStageImageView(image: "Twilight")
                VStack{
                    Button{
                        num = num - 1
                    }label: {
                        Text("이전 스테이지로")
                    }
                    Button{
                        num = num + 1
                    }label: {
                        Text("다음 스테이지로")
                    }
                    InventoryView(image: "minimap")
                }
                
            }
            else if num == 2{
                NextStageImageView(image: "startzone")
                Button{
                    num = num - 1
                }label: {
                    Text("이전 스테이지로")
                }
            }
        }
    }
}

struct DeepDarkView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDarkView()
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

