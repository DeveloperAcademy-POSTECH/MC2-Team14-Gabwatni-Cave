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
    
    let size: CGRect = UIScreen.main.bounds
    
    @State var presentView: Bool = false
    @State var showingImage: String = ""
    
    @State var testRender: Bool = false
    
    var mainflow: Int
    
    @State var darkTalk: Bool = false
    @State var firstTalk: Bool = true
    
    let textArray: [String] = ["이제 다음은 마지막 존이니 조심하시게!", " "]
    
    @State private var inputString = ""
    @State private var textEnd: Bool = false
    
    var body: some View {
            ZStack{
                Image("deepDark-edit")
                    .ignoresSafeArea()
                    .onTapGesture{
                        testRender.toggle()
                    }
                
                if !vm.fakeDie && !presentView && !darkTalk {
                    LightView()

                }
                
                if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]!  {
                    LightItemView(thisPositionX: 180, thisPositionY: 380, thisFrameWidth: 100, thisFrameHeight: 100, isShowing: $presentView, imageName: "footprint", degreeNum: 55.0, showingImage: showingImage)
                }
                
                
                LightItemView(thisPositionX: 0, thisPositionY: 0, thisFrameWidth: 100, thisFrameHeight: 100, isShowing: $presentView, imageName: "fakefootprint", showingImage: showingImage)
                
                LightItemView(thisPositionX: -50, thisPositionY: 300, thisFrameWidth: 100, thisFrameHeight: 150, isShowing: $presentView, imageName: "dragonmillipede", showingImage: showingImage)
                
                LightItemView(thisPositionX: 200, thisPositionY: -200, thisFrameWidth: 150, thisFrameHeight: 150, isShowing: $presentView, imageName: "arachnocampa", degreeNum: 20.0, showingImage: showingImage)
                
                if presentView {
                    CardView(imageName: vm.imageName, cardState: $presentView)
                        .onDisappear {
                            vm.itemDict[vm.imageName] = true
                            
                            if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]! {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                                    darkTalk = true
                                }
                            }
                        }
                }
                
                if vm.fakeDie {
                    DeepDarkFakeDieView(darkTalk: $darkTalk)
                }
                
                if !vm.fakeDie && darkTalk {
                    Rectangle()
                        .foregroundColor(.black)
                        .ignoresSafeArea()
                    
                    Image("dongdal")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(y: -80)
                    
                    textBox(name: "동달", text: inputString)
                        .onAppear {
                            talkOnTextBox(stringArray: textArray, inputIndex: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                darkTalk = false
                            }
                    }
                }
            }
    }
    
    func talkOnTextBox (stringArray: [String], inputIndex: Int){
        inputString = ""
        textEnd = false
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
