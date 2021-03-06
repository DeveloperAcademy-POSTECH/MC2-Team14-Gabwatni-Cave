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
    
    @State var showSheet = false
    @State var presentView: Bool = false
    @State var showingImage: String = ""
    
    @State var testRender: Bool = false
    
    var mainflow: Int
    
    @State var darkTalk: Bool = false
    @State var firstTalk: Bool = true
    
    let textArray: [String] = ["다음은 마지막 장소가 될테니 조심하시게!", " "]
    
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
                    
                    Image("mapIcon")
                        .resizable()
                        .shadow(color: .gray, radius: 2, x: 2, y: 2)
                        .position(x: 180, y: -315)
                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/12)
                        .onTapGesture {
                            playSoundEffect(sound: "mapGain", type: ".wav")
                            showSheet.toggle()
                        }
                        .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView(image: "minimap", myPosition: "현재 위치: 칠흑의 방")})

                }
                
                if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]! && vm.itemDict["transparent snail"]!  {
                    LightItemView(thisPositionX: 180, thisPositionY: 380, thisFrameWidth: 100, thisFrameHeight: 100, isShowing: $presentView, imageName: "footprint", degreeNum: 55.0, showingImage: showingImage)
                }
                
                
                LightItemView(thisPositionX: 0, thisPositionY: 0, thisFrameWidth: 100, thisFrameHeight: 100, isShowing: $presentView, imageName: "fakefootprint", showingImage: showingImage)
                
                LightItemView(thisPositionX: -60, thisPositionY: -220, thisFrameWidth: 100, thisFrameHeight: 150, isShowing: $presentView, imageName: "transparent snail", showingImage: showingImage)
                
                LightItemView(thisPositionX: -50, thisPositionY: 300, thisFrameWidth: 100, thisFrameHeight: 150, isShowing: $presentView, imageName: "dragonmillipede", showingImage: showingImage)
                
                LightItemView(thisPositionX: 200, thisPositionY: -200, thisFrameWidth: 150, thisFrameHeight: 150, isShowing: $presentView, imageName: "arachnocampa", degreeNum: 20.0, showingImage: showingImage)
                
                if presentView {
                    CardView(imageName: vm.imageName, cardState: $presentView)
                        .onDisappear {
                            vm.itemDict[vm.imageName] = true
                            
                            if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]! && vm.itemDict["transparent snail"]! {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                                    darkTalk = true
                                }
                            }
                        }
                }
                
                if vm.fakeDie {
                    DeepDarkFakeDieView(darkTalk: $darkTalk)
                        .onDisappear {
                            vm.isSound = false
                        }
                }
                
                if !vm.fakeDie && darkTalk {
                    Rectangle()
                        .foregroundColor(.black)
                        .ignoresSafeArea()
                    
                    Image("dongdal")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.height / 20 * 9, height: UIScreen.main.bounds.height / 20 * 6)
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
