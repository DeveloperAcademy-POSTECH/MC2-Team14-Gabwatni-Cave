//
//  LightItemView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/14.
//

import SwiftUI

struct LightItemView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    let thisPositionX: CGFloat
    let thisPositionY: CGFloat
    let thisFrameWidth: CGFloat
    let thisFrameHeight: CGFloat
    
    @Binding var isShowing: Bool
    
    @State var imageName: String
    private(set) var degreeNum: Double = 0.0
    
    @State var showingImage: String
    
    let size = UIScreen.main.bounds
    
    @State private var animationAmount: CGFloat = 1
    @State var isViewing: Bool = false
    
    var body: some View {
        let distance = sqrt((pow(vm.dragOffset.width - thisPositionX, 2)) + pow(vm.dragOffset.height - thisPositionY, 2))
        
        // 거리 <= 루트(상호작용 물체의 프레임/2) + 손전등 반지름(100)
        if distance <= sqrt(2) * (thisFrameWidth / 2.3) + 80 {
            if imageName == "footprint"{
                Image(imageName)
                    .shimmered(degreeNum: 15.0)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            if !vm.isSound {
                                playSoundEffect(sound: "walk", type: ".mp3")
                                vm.isSound = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                if vm.flow == 2 {
                                    vm.flow = 3
                                } else if vm.flow == 3 && vm.itemDict["dragonmillipede"]! {
                                    vm.flow = 4
                                }
                            }
                        }
                    }
            } else if imageName == "fakefootprint" {
                Image(imageName)
                    .shimmered(degreeNum: -20.0)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            if !vm.isSound {
                                playSoundEffect(sound: "walk", type: ".mp3")
                                vm.isSound = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                vm.fakeDie = true
                            }
                        }
                    }
            }
            else if imageName == "cheatbutton" {
                Image(imageName)
                    .shimmered(degreeNum: 15.0)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            if !vm.isSound {
                                playSoundEffect(sound: "walk", type: ".mp3")
                                vm.isSound = true
                            }
                            vm.flow = 4
                        }
                    }
            }
            
            else if imageName == "circle"{
                Circle()
                    .inset(by: 0)
                    .stroke(.white, lineWidth: 2)
                    .opacity(isViewing ? 0 : 1)
                    .overlay {
                        Button {
                            if vm.flow == 2 {
                                vm.imageName = showingImage
                                isShowing = true
                            }
                            else if vm.flow == 4 {
                                if vm.isBossShowingBefore {
                                    vm.isBossTalk = true
                                }
                                else {
                                    vm.isBossShowingBefore = true
                                    isShowing = true
                                    if showingImage != imageName && showingImage.count != 0 {
                                        print(showingImage)
                                        imageName = showingImage
                                    }
                                    vm.imageName = imageName
                                    isViewing.toggle()
                                }
                            }
                            
                            
                        } label: {
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .scaleEffect(animationAmount)
                            //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                                .opacity(Double(2 - animationAmount))
                                .animation(Animation.easeInOut(duration: 1.2)
                                    .repeatForever(autoreverses: false))
                        }
                        
                        
                        
                        
                    }
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: 20, height: 20, alignment: .center)
                
                    .onAppear {
                        self.animationAmount = 2
                    }
                    .onDisappear {
                        self.animationAmount = 1
                    }
                
            }
            
            else {
                Image(imageName)
                    .shimmered(degreeNum: 30)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        if imageName == "bat" {
                            playSoundBat(sound: "bat", type: ".mp3")
                        }
                        isShowing.toggle()
                        if showingImage != imageName && showingImage.count != 0 {
                            print(showingImage)
                            imageName = showingImage
                        }
                        vm.imageName = imageName
                    }
            }
            
        }
        
    }
}

extension Image {
    func shimmered(degreeNum: Double) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(.degrees(degreeNum))
            .shimmering()
    }
}
