//
//  EntranceView.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct EntranceView: View {
    @State var str = ""
    @State var str2 = "어떻게 잡았지"
    @State var StrArr : [String] = ["헉! 자네는 최가문의 후예...","드디어 나를 구하러 왔는가 소년이여...", "자네를 300년 동안 기다렸다네...","반갑소! 난 동달이라네!","혹시 저의 할아버지의 할아버지의 할아버지를 아시나요?", "아... 그는 나랑 같이 동굴을 탈출하려던 동료였다네...(아련)","자네도 나와 함께 동굴 탈출을 시도해보지 않겠나?","물론이죠! 가문의 이름을 걸고 탈출하겠습니다.","그렇다면 출발 전에 동굴에 대한 간단한 설명을 해주겠네...", "이 동굴은 석회동굴이라네...\n저런 종유석들이 있는게 특징이지.","오른쪽의 동그란 원을 눌러 한번 자세히 살펴보지 않겠나?", "카드를 누르면 다른 사진도 볼 수 있다네...", " " ]
    @State var charArr : [String] = ["동달","동달", "동달","동달","최병호","동달","동달","최병호","동달","동달","동달","동달"," " ]
    @State var stringNumber = 0
    @State var toggle  = false
    @State var isClicked = false
    @State var isFinished = false
    @State var xPosition : CGFloat = UIScreen.main.bounds.width/2
    @State var yPosition : CGFloat = UIScreen.main.bounds.height/3
    
    @State var degree : Double = 0
    
    @Binding var flow : Int
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
                        
                        if !isClicked{
                            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){(timer) in
                                if degree == 360 {
                                    timer.invalidate()
                                }else{
                                    degree += 20
                                }
                                
                            }
                            
                            ges(strnum: stringNumber)
                            isClicked = true
                            AudioServicesPlaySystemSound(1311)
                            if stringNumber < 12{
                                stringNumber+=1
                                
                            }
                            else if stringNumber == 12{
                                flow = 1
                                
                            }
                        }
                        
                    } label: {
                        Image(!isClicked ? "동달" : charArr[stringNumber-1])
                            .resizable()
//                            .scaleEffect(1.0)
                            .frame(width: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/20 * 9 : UIScreen.main.bounds.height/4, height: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/20 * 6 : UIScreen.main.bounds.height/4*2, alignment: .center)
                            .rotationEffect(.degrees(degree))
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
                                if stringNumber < 12{
                                    stringNumber+=1
                                    
                                }
                                else if stringNumber == 12{
                                    flow = 1
                                    
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



struct TextBox: View {
    var body: some View{
        ZStack{
            Image("textbox")
        }
    }

}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
}


