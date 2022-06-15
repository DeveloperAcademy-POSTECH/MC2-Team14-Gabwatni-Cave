//
//  DeepDarkFakeDieView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/14.
//

import SwiftUI
import AVFoundation

struct DeepDarkFakeDieView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    let textArray: [String] = ["다 살펴보지 않았는데, 벌써 갈거야?", " "]
    @State private var inputString = ""
    @State private var textEnd: Bool = false
    
    @Binding var darkTalk: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            
                Image("dongdal")
                    .resizable()
                    .frame(width: 100, height: 100)
//                    .onTapGesture {
//                        darkTalk = false
//                        vm.fakeDie = false
//                    }
                
                textBox(name: "동달", text: inputString)
                .onAppear {
                    talkOnTextBox(stringArray: textArray, inputIndex: 0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        darkTalk = false
                        vm.fakeDie = false
                    }
                }
        //            .onTapGesture {
        //                darkTalk = false
        //                vm.fakeDie = false
        //            }
                
                    //DeathView(reasonText: "좁은 틈에 끼여서", tipText: "막 누르시면 안됩니다..!")
            
           
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
