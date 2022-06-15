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
    
    let textArray: [String] = ["아직 다 살펴보지 않았는데, 벌써 갈건가? 여기 그리고 좁아보이지 않나?", " "]
    let textArray2: [String] = ["병호군 여기로 들어갈 수 있을거라 생각하시나?", " "]
    
    @State private var inputString: String = ""
    @State private var textEnd: Bool = false
    
    @State private var isViewing: Bool = true
    @Binding var darkTalk: Bool
    
    @State private var realDie: Bool = false
    
    @State var isEnd = true
    var body: some View {
        if realDie {
            if isEnd{
                CaveDeathView(isEnd: $isEnd)
            }
            else{
                DeathView(reasonText: "동달의 말을 듣지 않아서", tipText: "말을 잘 들읍시다.")
            }
        }
        else {
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                Image("dongdal")
                    .resizable()
                    .frame(width: 300, height: 300)
                  
                if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]! {
                    textBox(name: "동달", text: inputString)
                        .onAppear {
                            talkOnTextBox(stringArray: textArray2, inputIndex: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                isViewing = false
                            }
                        }
                        .opacity(isViewing ? 1 : 0)
                    
                    Group {
                        VStack(spacing: 30){
                            Spacer()
                            Button {
                                realDie = true
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .overlay{
                                        Text("그래도 저는 갑니다.")
                                            .font(.custom("Sam3KRFont", size: 16))
                                            .foregroundColor(.white)
                                    }
                                
                            }
                            
                            Button {
                                darkTalk = false
                                vm.fakeDie = false
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .overlay{
                                        Text("너무 좁아보이긴 하네요... 다른 곳을 찾아 볼게요!")
                                            .font(.custom("Sam3KRFont", size: 16))
                                            .foregroundColor(.white)
                                    }
                                
                            }
                            .padding(.bottom, 80)
                        }
                        
                    }
                    .opacity(isViewing ? 0 : 1)
                    
                }
                else {
                    textBox(name: "동달", text: inputString)
                        .onAppear {
                            talkOnTextBox(stringArray: textArray, inputIndex: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                isViewing = false
                            }
                            
                        }
                        .opacity(isViewing ? 1 : 0)
                    
                    Group {
                        VStack(spacing: 30){
                            Spacer()
                            Button {
                                realDie = true
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .overlay{
                                        Text("그래도 저는 갑니다.")
                                            .font(.custom("Sam3KRFont", size: 16))
                                            .foregroundColor(.white)
                                    }
                                
                            }
                            
                            Button {
                                darkTalk = false
                                vm.fakeDie = false
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                    .overlay{
                                        Text("너무 좁아보이긴 하네요... 다른 곳을 찾아 볼게요!")
                                            .font(.custom("Sam3KRFont", size: 16))
                                            .foregroundColor(.white)
                                    }
                                
                            }
                            .padding(.bottom, 80)
                        }
                        
                    }
                    .opacity(isViewing ? 0 : 1)
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
