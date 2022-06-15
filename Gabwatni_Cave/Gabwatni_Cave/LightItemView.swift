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
    
    private(set) var imageName: String
    private(set) var degreeNum: Double = 0.0
    
    @Binding var showingImage: String
    
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
                        withAnimation(.easeIn(duration: 0.9)) {
                            playSoundEffect(sound: "walk", type: ".mp3")
                            
                                vm.flow += 1
                            
                        }
                    }
            } else if imageName == "fakefootprint" {
                Image(imageName)
                    .shimmered(degreeNum: -20.0)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        vm.fakeDie = true
                        withAnimation(.easeIn) {
                            playSoundEffect(sound: "walk", type: ".mp3")
                            
                        }
                    }
            }
            
            else {
                Image(imageName)
                    .shimmered(degreeNum: 30)
                    .position(x: thisPositionX, y: thisPositionY)
                    .frame(width: thisFrameWidth, height: thisFrameHeight)
                    .onTapGesture {
                        isShowing.toggle()
                        showingImage = imageName
                        vm.itemDict[imageName] = true
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
