//
//  TwilightView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct TwilightView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    let size: CGRect = UIScreen.main.bounds
    
    var zoneText: String = "Twilight Zone"
    var zoneDescribe: String = "빛과 어둠이\n 만나는 곳"
    
    @State var isFirst: Bool = true
    
    @State var presentView: Bool = false
    @State var showingImage: String = ""
    
    @State var testRender: Bool = false
    
    var mainflow: Int
    
    @State var twilightTalk: Bool = false
    @State var firstTalk: Bool = true
    
    let textArray: [String] = ["이제 정보는 모은거 같으니, 다음 존으로 가는 길을 찾아봐", " "]
    @State private var inputString = ""
    @State private var textEnd: Bool = false
    
    var body: some View {
        ZStack{
            Image("twillight-edit")
                .ignoresSafeArea()
                .onTapGesture{
                    testRender.toggle()
                }
            
            if !presentView && !twilightTalk  {
                LightView()
                    .opacity(0.9)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            if vm.itemDict["bat"]! && vm.itemDict["salamander"]! && firstTalk {
                                twilightTalk = true
                                firstTalk = false
                            }
                        }
                    }
            }
            
            if vm.itemDict["bat"]! && vm.itemDict["salamander"]! {
                LightItemView(thisPositionX: 180, thisPositionY: 380, thisFrameWidth: 150, thisFrameHeight: 100, isShowing: $presentView, imageName: "footprint", degreeNum: 50.0, showingImage: $showingImage)
            }
            
            LightItemView(thisPositionX: 200, thisPositionY: 100, thisFrameWidth: 100, thisFrameHeight: 250, isShowing: $presentView, imageName: "bat", degreeNum: 55.0, showingImage: $showingImage)
            
            LightItemView(thisPositionX: -80, thisPositionY: 350, thisFrameWidth: 150, thisFrameHeight: 150, isShowing: $presentView, imageName: "salamander", degreeNum: 30.0, showingImage: $showingImage)
            
            if presentView {
                CardView(imageName: showingImage, cardState: $presentView)
                    .padding(.top, 40)
            }
            
            if twilightTalk {
                Rectangle()
                    .foregroundColor(.black)
                
                Image("dongdal")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                textBox(name: "동달", text: inputString)
                    .onAppear {
                        talkOnTextBox(stringArray: textArray, inputIndex: 0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            twilightTalk = false
                        }
                    }
                
            }
            
            // 진입하면 나오는 view
            ZStack{
                Image("light and darkness meet")
                    .ignoresSafeArea()
                VStack{
                    Text(zoneText)
                        .font(.custom("Sam3KRFont", size: 28))
                        .foregroundColor(.white)
                    Text(zoneDescribe)
                        .kerning(5)
                        .lineSpacing(10)
                        .font(.custom("Sam3KRFont", size: 38))
                        .foregroundColor(.white)
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isFirst.toggle()
                }
            }
            .opacity(isFirst ? 1 : 0)
            .animation(.easeIn(duration: 0.8), value: isFirst)
        }
        .onDisappear{
            vm.dragOffset = CGSize.zero
            vm.dragOffset2 = CGSize.zero
        }
    }
    
    func talkOnTextBox (stringArray: [String], inputIndex: Int){
        inputString = ""
        let length = stringArray[inputIndex].count
        var index = 0
        var toggle = false
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if inputIndex >= stringArray.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1104)
            inputString += String(stringArray[inputIndex][stringArray[inputIndex].index(stringArray[inputIndex].startIndex, offsetBy: index)])
            index+=1
            
            if index == length{
                timer.invalidate()
                textEnd.toggle()
            }
            
            if toggle {
                timer.invalidate()
                inputString += stringArray[inputIndex].substring(from: index, to: length-1)
                toggle.toggle()
            }
            
        }
    }
}
