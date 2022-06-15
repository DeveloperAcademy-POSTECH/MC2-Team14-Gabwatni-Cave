//
//  EntranceView-end.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/12.
//

import SwiftUI
import AVFoundation
struct EntranceView_end: View {
    @EnvironmentObject var vm: CardViewModel2
    
    @State var footPrintTapped = false
    
    var mainflow: Int
    //@Binding var mainflow : Int
    
    @Binding var flow : Int
    @State var str = ""
    @State var str2 = "어떻게 잡았지"
    @State var StrArr : [String] = ["잘했네!","이렇게 상호작용을 통해 동굴의 정보를 파악해야 탈출이 가능하다는 점 알아두시게!","이제 어느정도 준비가 된거 같으니 발자국 버튼을 눌러 다음 장소로 이동해봅세..."," " ]
    @State var charArr : [String] = ["동달","동달", "동달"," " ]
    @State var stringNumber = 0
    @State var toggle  = false
    @State var isClicked = false
    @State var isFinished = false
    @State var isEnd = false
    @State var xPosition : CGFloat = UIScreen.main.bounds.width/2
    @State var yPosition : CGFloat = UIScreen.main.bounds.height/3
    
    var body: some View {
        ZStack{
            Image("entrancecave")
                .resizable()
                .ignoresSafeArea()
            Color.black.opacity(0.5)
            .ignoresSafeArea()
            VStack{
                GeometryReader{geo in
                    Button {
//                        if !isClicked{
//                            ges(strnum: stringNumber)
//                            isClicked = true
//                            AudioServicesPlaySystemSound(1311)
//                            if stringNumber < 3{
//                                stringNumber+=1
//                                print(stringNumber)
//                            }
//                            else if stringNumber == 3{
//
//                                print("다음스테이지로 넘어가는 함수")
//                            }
//                        }
                        
                    } label: {
                        Image(!isClicked ? "동달" : charArr[stringNumber-1])
                            .resizable()
                            .scaleEffect(1.0)
                            .frame(width: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/20 * 9: UIScreen.main.bounds.height/4, height: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/20 * 6: UIScreen.main.bounds.height/4*2, alignment: .center)
                            
                    }
                    .position(x: xPosition
                              , y: yPosition)
                   
                    if isClicked{
                        Text(!isClicked ? "동달" : charArr[stringNumber-1])
                                .font(.custom("Sam3KRFont", size: 20))
                                .foregroundColor(.white)
                                .position(x: UIScreen.main.bounds.width/5
                                          , y: UIScreen.main.bounds.height/10 * 7)
                        
                        Text(str)
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 100, alignment: .center)
                            .overlay(
                                    TextBox()
                                )
                            .position(x: UIScreen.main.bounds.width/2
                                      , y: UIScreen.main.bounds.height/9 * 7)
                        if isFinished{
                            Button{
                                ges(strnum: stringNumber)
                                isClicked = true
                                if stringNumber < 3{
                                    stringNumber+=1
                                   
                                }
                                else if stringNumber == 3{
                                    isEnd = true
                                    isClicked = false
                                    
                                }
                                isFinished.toggle()
                            }
                        label:{
                            Text("다음")
                                    .font(.custom("Sam3KRFont", size: 20))
                                    .foregroundColor(.white)
                                    
                        }
                        .position(x: UIScreen.main.bounds.width/16 * 13
                                  , y: UIScreen.main.bounds.height/15 * 13)
                        }
                        
                        
                    }
                    if isEnd{
                        Button{
                            footPrintTapped = true
                            playSoundEffect(sound: "walk", type: ".mp3")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                vm.flow = 2
                                                        }
                        }label: {
                            Image("footprint")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5, alignment: .center)
                        }
                        .position(x: UIScreen.main.bounds.width/2
                                  , y: UIScreen.main.bounds.height/5 * 3)
                        .disabled(footPrintTapped)
                        
                    }
                }
                
            }.onAppear(){
                if !isClicked{
                    ges(strnum: stringNumber)
                    isClicked = true
                    AudioServicesPlaySystemSound(1311)
                    if stringNumber < 3{
                        stringNumber+=1
                        
                    }
                    else if stringNumber == 3{
                       
                        print("다음스테이지로 넘어가는 함수")
                    }
                }
            }
            
            
        }
    }
    
    func ges(strnum : Int){
        str = ""
        let length = StrArr[strnum].count
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if strnum >= StrArr.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1104)
            str += String(StrArr[strnum][StrArr[strnum].index(StrArr[strnum].startIndex, offsetBy: index)])
            index+=1
            if index == length{
                timer.invalidate()
                isFinished.toggle()
            }
            if(toggle){
                timer.invalidate()
                str += StrArr[strnum].substring(from: index, to: length-1)
                toggle.toggle()
            }

        }
        
        
    }
}


