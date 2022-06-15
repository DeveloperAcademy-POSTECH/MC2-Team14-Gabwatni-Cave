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
            
            else {
                Image(imageName)
                    .shimmered(degreeNum: 30)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        if imageName == "bat" {
                            playSoundEffect(sound: "bat", type: ".mp3")
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
