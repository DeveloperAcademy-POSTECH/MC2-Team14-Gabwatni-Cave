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
    
    let textArray: [String] = ["아직 내부를 다 살펴보지 않았는데 벌써 갈건가?", "게다가 그곳은 좀 좁아보이지 않나?", " "]
    let textArray2: [String] = ["병호군 여기로 들어갈 수 있을거라 생각하시나?", " "]
    
    @State private var inputString: String = ""
    @State private var textEnd: Bool = false
    
    @State private var isViewing: Bool = true
    @Binding var darkTalk: Bool
    @State private var textIndex: Int = 0
    
    @State private var realDie: Bool = false
    
    @State var isEnd = true
    
    var body: some View {
        if realDie {
          
            CaveDeathView(isEnd: $isEnd, realDie: $realDie)
            
//            else{
//                DeathView(reasonText: "동달의 말을 듣지 않아서", tipText: "말을 잘 들읍시다.")
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//                            print(realDie)
//                            print("hihi")
//                            vm.flow = 3
//                        }
//                    }
//            }
        }
        else {
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                Image("dongdal")
                    .resizable()
                    
                    .frame(width: UIScreen.main.bounds.height / 20 * 9, height: UIScreen.main.bounds.height / 20 * 6)
                    .offset(y: -80)
                  
                if vm.itemDict["arachnocampa"]! && vm.itemDict["dragonmillipede"]! {
                    textBox(name: "동달", text: inputString)
                        .onAppear {
                            talkOnTextBox(stringArray: textArray2, inputIndex: 0)
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//                                isViewing = false
//                            }
                        }
                        .opacity(isViewing ? 1 : 0)
                    if textEnd {
                        Button{
                            //talkOnTextBox(stringArray: textArray2, inputIndex: 1)
                            textEnd.toggle()
                            isViewing = false
                        }
                    label:{
                        Text("다음")
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.size.width+300, height: UIScreen.main.bounds.size.height+600, alignment: .center)
                        
                    }
                    .position(x: UIScreen.main.bounds.width/16 * 13
                              , y: UIScreen.main.bounds.height/15 * 13)
                        
                    }
                    
                    Group {
                        VStack(spacing: 20){
                            Spacer()
                            Button {
                                realDie = true
                            } label: {
                                ZStack {
                                    Image("textbox")
                                        .resizable()
                                        .frame(width: 310, height: 60)
                                    
                                    Text("그래도 저는 갑니다!")
                                        .font(.custom("Sam3KRFont", size: 20))
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            Button {
                                darkTalk = false
                                vm.fakeDie = false
                            } label: {
                                ZStack {
                                    Image("textbox")
                                        .resizable()
                                        .frame(width: 310, height: 60)
                                    
                                    Text("다른 곳을 찾아 볼게요!")
                                        .font(.custom("Sam3KRFont", size: 20))
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
                            talkOnTextBox(stringArray: textArray, inputIndex: textIndex)
                            textIndex += 1
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//                                isViewing = false
//                            }
                        }
                        .opacity(isViewing ? 1 : 0)
                    if textEnd {
                        Button{
                            talkOnTextBox(stringArray: textArray, inputIndex: textIndex)
                            
                            
                            if textIndex == 2 {
                                textEnd.toggle()
                                isViewing = false
                            }
                            textIndex += 1
                        }
                    label:{
                        Text("다음")
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.size.width+300, height: UIScreen.main.bounds.size.height+600, alignment: .center)
                    }
                    .position(x: UIScreen.main.bounds.width/16 * 13
                              , y: UIScreen.main.bounds.height/15 * 13)
                        
                    }
                    Group {
                        VStack(spacing: 20){
                            Spacer()
                            Button {
                                realDie = true
                            } label: {
                                ZStack {
                                    Image("textbox")
                                        .resizable()
                                        .frame(width: 310, height: 60)
                                    
                                    Text("그래도 저는 갑니다!")
                                        .font(.custom("Sam3KRFont", size: 20))
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            Button {
                                darkTalk = false
                                vm.fakeDie = false
                            } label: {
                                ZStack {
                                    Image("textbox")
                                        .resizable()
                                        .frame(width: 310, height: 60)
                                    
                                    Text("다른 곳을 찾아 볼게요!")
                                        .font(.custom("Sam3KRFont", size: 20))
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
