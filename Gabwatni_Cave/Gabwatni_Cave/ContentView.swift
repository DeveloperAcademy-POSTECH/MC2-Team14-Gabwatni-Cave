//
//  ContentView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : CardViewModel2
    
    var body: some View {
        if vm.flow == -1 {
            IntroControl()
        }
        else if vm.flow == 0 {
            AncestorView(mainflow: vm.flow)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                        print("3")
                        playSound(sound: "let`s start", type: "mp3")
                    }
                }
                .onDisappear {
                    vm.isSound = false
                }
        }
        else if vm.flow == 1 {
            EntranceControl()
                .onDisappear {
                    vm.isSound = false
                }
        }
        else if vm.flow == 2 {
            Dongdalsays()
                .onAppear {
                    vm.isSound = false
                    vm.itemDict["bat"] = false
                    vm.itemDict["salamander"] = false
                }
        }
        else if vm.flow == 3 {
            DeepDarkControl(mainflow: vm.flow)
                .onAppear {
                    vm.isSound = false
                }
                .onDisappear {
                    vm.dragOffset = CGSize.zero
                    vm.dragOffset2 = CGSize.zero
                }
        }   
        else if vm.flow == 4 {
            
            Abyss(abyssView: true, presentView: false)
                .onAppear {
                    vm.itemDict["water"] = false
                    vm.itemDict["cavecoral"] = false
                    vm.isBossShowingBefore = false
                    vm.isBossTalk = false
                    print(vm.itemDict["water"]!)
                }
        }
        else if vm.flow == 5 {
            ClearView()
        }

        else if vm.flow == 7{
            WorldMapView2(image: "worldend", myPosition: "다음 모험을 떠나볼까...")
        }
        else {
            DeathView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
