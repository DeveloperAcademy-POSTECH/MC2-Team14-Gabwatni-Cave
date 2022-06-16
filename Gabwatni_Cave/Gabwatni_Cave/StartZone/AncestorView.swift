//
//  AncestorView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI
import Shimmer
import AVFoundation

struct AncestorView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var footPrintTapped = false
    
    var mainflow : Int
    //@Binding var mainflow : Int
    
    // 각 Object의 초기 위치, 화면이 이동하면서 위치도 함께 이동
    @State private var imageScrollLocation: CGPoint = CGPoint(x: 500, y: 400)
    @State private var lightLocation: CGPoint = CGPoint(x: 410, y: 370)
    @State private var ancestorLocation: CGPoint = CGPoint(x: 625, y: 450)
    
    // Object 관련
    @State private var ancestorState: Bool = true
    @State private var lightState: Bool = false
    
    // @Binding var flow: Int
    @State private var flow = 0
    
    @State private var footprintState = false
    
    // TextBox 관련
    @State private var textboxState: [Bool] = [false, false, false] // [시작, 조상님, 손전등]
    @State private var textEnd: Bool = false
    @State private var inputString = ""
    @State private var stringArrayIndex = 0
    let startStringArray : [String] = ["어지러워...여긴 어디지?", "혹시 저 해골은 할아버지의 할아버지의 할아버지?!","(잠시 묵념을 한다.)", "손에 들고 계신건 뭐지?", "(해골을 눌러보세요.)"," "]
    let mapStringArray : [String] = ["어라?", "이건 지도인가..?", "(지도를 획득했다.)", "저기 왼쪽에 반짝이는건 뭐지?", "(왼쪽의 손전등을 눌러보세요.)"," "]
    let flashStringArray : [String] = ["오잉??", "이건 후레시!?", "(손전등을 획득했다.)","앞으로 좀 더 가볼까?","(발자국 버튼을 눌러 다음 장소로 이동하세요.)", " "]
    
    var body: some View {
        ZStack {
            if flow == 0 {
                StartZoneStartView
                    .onAppear {
                        playSound(sound: "rain", type: "mp3")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation(.easeInOut(duration: 2)) {
                                flow = 1
                            }
                        }
                    }
            } else if flow == 1 {
                ZStack{
                    
                    AncestorPageView
                    
                }
            }
        }
    }
    
    private var StartZoneStartView: some View {
        ZStack {
            Rectangle()
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 3)))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Image("startzone")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 450)
                )
            
            Button{
                withAnimation(.easeIn) {
                    flow = 1
                }
            } label: {
                Text("조상님의 안식처")
                    .font(.custom("Sam3KRFont", size: 40))
                    .foregroundColor(.white)
            }
        }
        
    }
    
    private var AncestorPageView: some View {
        ZStack {
            Rectangle()
                .transition(AnyTransition.opacity.animation(.easeIn(duration: 2)))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    ZStack {
                        Image("ancestor")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 1300)
                            .position(imageScrollLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3)) {
                                    imageScrollLocation.x = 150
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    withAnimation(.easeInOut) {
                                        textboxState[0] = true
                                    }
                                }
                            }
                            .edgesIgnoringSafeArea(.all)
                        
                        RainEffect()
                        
                        AncestorShimmeringView
                        flashShimmeringView
                        
                        // 시작 대화
                        if textboxState[0] == true {
                            textBox(name: "최병호", text: inputString)
                                .onAppear {
                                    talkOnTextBox(stringArray: startStringArray, inputIndex: stringArrayIndex)
                                }
                            if textEnd {
                                Button{
                                    talkOnTextBox(stringArray: startStringArray, inputIndex: stringArrayIndex)
                                    textEnd.toggle()
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
                        }
                        
                        // 지도 획득
                        if textboxState[1] == true {
                            textBox(name: "최병호", text: inputString)
                                .onAppear {
                                    talkOnTextBox(stringArray: mapStringArray, inputIndex: stringArrayIndex)
                                }
                            if textEnd {
                                Button{
                                    talkOnTextBox(stringArray: mapStringArray, inputIndex: stringArrayIndex)
                                    textEnd.toggle()
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
                        }
                        
                        // 손전등 발견
                        if textboxState[2] == true {
                            textBox(name: "최병호", text: inputString)
                                .onAppear {
                                    talkOnTextBox(stringArray: flashStringArray, inputIndex: stringArrayIndex)
                                }
                            if textEnd {
                                Button{
                                    talkOnTextBox(stringArray: flashStringArray, inputIndex: stringArrayIndex)
                                    textEnd.toggle()
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
                        }
                        
                        // 대화창 모두 종료 -> 다음 버튼 활성화 하기
                        if footprintState {
                            HStack{
                                Button{
                                    footPrintTapped = true
                                    withAnimation(.easeIn) {
                                        //mainflow = 1
                                        playSoundEffect(sound: "walk", type: ".mp3")
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                            withAnimation(.easeInOut(duration: 2)) {
                                                vm.flow = 1
                                            }
                                        }
                                    }
                                }label: {
                                    //Image("salamander")
                                    Image("footprint")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .foregroundColor(.white)
                                        .opacity(0.8)
                                }
                            }
                            .position(x: 200, y: 330)
                            .disabled(footPrintTapped)
                        }
                        
                        // 오브젝트를 발견했을 때 띄워주는 뷰
                        if (stringArrayIndex == 2 || stringArrayIndex == 3) {
                            if textboxState[1] {
                                TadaView(imageName: "mapIcon", rotate: 0)
                                
                            } else if textboxState[2] {
                                TadaView(imageName: "flashlight", rotate: 30)
                            }
                        }
                    }
                )
                .onDisappear { // 다른 뷰에서 넘어올 때 위치 초기화
                    lightLocation.x = 410
                    imageScrollLocation.x = 500
                    ancestorLocation.x = 625
                }
        }
    }
    
    
    private var AncestorShimmeringView: some View {
        Button {
            playSoundEffect(sound: "mapGain", type: ".wav")
            //stringArrayIndex += 1
            withAnimation(.easeOut(duration: 2)) {
                ancestorState = false
            }
            withAnimation(.easeInOut) {
                textboxState[0] = false
                stringArrayIndex = 0
                textboxState[1] = true
            }
            
        } label: {
            if ancestorState {
                ZStack {
                    // shimmering opacity가 너무 작은 것 같아서 이미지 하나 더 올림
                    Image("skeletonMapO")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.7)
                    Image("skeletonMapO")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .shimmering(active: ancestorState, duration: 2.0)
                }
            } else {
                Image("skeletonMapX")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: 200, height: 200)
        .position(ancestorLocation)
        .onAppear{
            withAnimation(.easeIn(duration: 3)) {
                ancestorLocation.x = 275
            }
        }
        //.disabled(!ancestorState || textboxState[0] == true)
        .disabled(!ancestorState || stringArrayIndex <= 4)
    }
    
    
    private var flashShimmeringView: some View {
        Button {
            playSoundEffect(sound: "flashGain", type: ".wav")
            withAnimation(.easeInOut) {
                lightState = false
                textboxState[1] = false
                stringArrayIndex = 0
                //textEnd.toggle()
                textboxState[2] = true
            }
        } label: {
            Image("flashlight")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .rotationEffect(.degrees(80))
                .opacity(lightState ? 1 : 0)
                .shimmering(active: lightState, duration: 2.0)
        }
        .position(lightLocation)
        .onAppear{
            withAnimation(.easeIn(duration: 3)) {
                lightLocation.x = 60
            }
        }
    }
    
    
    func talkOnTextBox (stringArray: [String], inputIndex: Int){
        inputString = ""
        let length = stringArray[inputIndex].count
        var index = 0
//        var toggle = false
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if inputIndex >= stringArray.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1104)
            inputString += String(stringArray[inputIndex][stringArray[inputIndex].index(stringArray[inputIndex].startIndex, offsetBy: index)])
            index+=1
            
            
                if index == length {
                    timer.invalidate()
                    if stringArrayIndex == stringArray.count - 1 {
                        textEnd = false
                    } else {
                        textEnd = true
                    }
                }
                        
        }
        
        if stringArrayIndex < stringArray.count - 1 {
            if stringArrayIndex == stringArray.count - 2 {
                if stringArray == mapStringArray {
                withAnimation(.easeIn(duration: 2)) {
                    lightState = true
                }
                } else if stringArray == flashStringArray {
                    withAnimation(.easeIn(duration: 2)) {
                        footprintState = true
                    }
                }
            }
            withAnimation(.easeIn(duration: 1)) {
                stringArrayIndex+=1
            }
            
        } else if stringArrayIndex == stringArray.count - 1 {

        }
    }
}

