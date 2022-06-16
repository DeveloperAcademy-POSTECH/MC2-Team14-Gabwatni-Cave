//
//  Abyss.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct Abyss: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var abyssView = true
    
    @State var isBoss: Bool = false
    
    let size = UIScreen.main.bounds
    
    private var zoneText: String = "Dark Zone"
    private var zoneDescribe: String = "심연의 공포"
    
    @State var presentView: Bool = false
    @State var showingImage: String = ""
    
    @State private var isFirst: Bool = true
    
    let textArray: [String] = ["뭔가 좀 이상행 내머리도 이상행", " "]
    let textArray2: [String] = ["아무리 찾아도 다음 정보가 없어.. 뭔가 이상해", " "]
    @State private var inputString = ""
    @State private var textEnd: Bool = false
    
    var body: some View {
        if abyssView {
            ZStack {
                Image("abyss")
                    .resizable()
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .scaledToFit()
                    .ignoresSafeArea()
                
                if !vm.isBossTalk && (!presentView || !abyssView) {
                    LightView()
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                if vm.itemDict["water"]! && vm.itemDict["cavecoral"]! {
                                    //
                                    playSoundEffect(sound: "bossSound1", type: ".mp3")
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                        withAnimation(.easeIn(duration: 1.5)){
                                            
                                            isBoss = true
                                            playSound(sound: "Action_Hero", type: ".mp3")
                                        }
                                    }
                                    
                                    
                                }
                            }
                        }
                }
                
                if !vm.isBossShowingBefore {
                    LightItemView(thisPositionX: 50, thisPositionY: 300, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "water")
                }
                
                
                if vm.isBossShowingBefore {
                    LightItemView(thisPositionX: -75, thisPositionY: -200, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "cavecoral")
                }
                
                
                
                //                LightItemView(thisPositionX: 50, thisPositionY: 300, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "water")
                //
                //                LightItemView(thisPositionX: -75, thisPositionY: -200, thisFrameWidth: 30, thisFrameHeight: 30, isShowing: $presentView, imageName: "circle", showingImage: "cavecoral")
                
                
                if presentView && !vm.isBossTalk{
                    CardView(imageName: vm.imageName, cardState: $presentView)
                        .onDisappear {
                            vm.itemDict[vm.imageName] = true
                        }
                }
                else if vm.isBossTalk {
                    Rectangle()
                        .foregroundColor(.black)
                        .ignoresSafeArea()
                    
                    Image("choi byung-ho")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(y: -80)
                        .onTapGesture {
                            vm.isBossTalk = false
                        }
                    
                    textBox(name: "병호쿤", text: inputString)
                        .onAppear {
                            talkOnTextBox(stringArray: textArray2, inputIndex: 0)
                        }
                        .onDisappear {
                            vm.itemDict["cavecoral"] = true
                        }
                }
                
                QuizView(quizModel: QuizModel())
                    .opacity(isBoss ? 1 : 0)
                
                // 진입하면 나오는 view
                ZStack {
                    Image("horror of the abyss")
                        .ignoresSafeArea()
                    VStack{
                        Text(zoneText)
                            .font(.custom("Sam3KRFont", size: 28))
                            .foregroundColor(.white)
                        Text(zoneDescribe)
                            .kerning(5)
                            .lineSpacing(10)
                            .font(.custom("Sam3KRFont", size: 42))
                            .foregroundColor(.white)
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        isFirst.toggle()
                    }
                }
                .opacity(isFirst ? 1 : 0)
                .animation(.easeIn, value: isFirst)
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
