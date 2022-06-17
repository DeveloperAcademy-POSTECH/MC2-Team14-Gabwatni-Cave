//
//  Character View.swift
//  practice
//
//  Created by 전호정 on 2022/06/12.
//

import SwiftUI

struct CharacterView: View {
    @Binding var flow : Int
    var body: some View {
        ZStack{
           
            Image("start")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
            
            Color.black.opacity(0.6)
            Image("choi byung-ho")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom,200)
                .frame(width: 200, height: 300)
            
            newTextBox2(control : $flow, StrArr: ["  최병호(29, 무직백수)","\"하.. 이번 시험도 떨어졌네...\"","\"부모님께 뭐라고 말씀드려야하나..\"","\"이젠 4수라 더 할 말도 없는데...\"","\"내 인생은 왜 이럴까....\"","(집에 도착했다.)","\"휴~ 다행이다. 집에 아무도 안 계시네.\"","\"얼른 놀러 나가야겠다.\"","\"이깟 공무원 시험이 뭐라고~ 내년에 꼭 붙으면 되지!\"","\"옷이나 갈아입자.\"","(옷장을 연다.)","\"어라? 내 슬랙스 어디갔지??\"","(옷장을 뒤적거린다.)"," "], charArr: [" "," "," "," "," "," "," "," "," "," "," "," "," "," "])
            
            
            //            ZStack{
            //            Text("최병호(29, 무직백수)")
            //                .font(.body)
            //                .fontWeight(.bold)
            //                .foregroundColor(Color.white)
            //                .multilineTextAlignment(.center)
            //                .padding(.top,450.0)
            //                .frame(height: -1.0)
            //
            //            Text("가문의 비밀이 담긴 보물지도를 발견하고")
            //                .foregroundColor(Color.white)
            //                .multilineTextAlignment(.center)
            //                .padding(.top,550)
            //
            //            Text("소원을 이루기 위해 모험을 떠나게 된다...")
            //                .foregroundColor(Color.white)
            //                .multilineTextAlignment(.center)
            //                .padding(.top,600)
            //            }
            
        }
    }
}


//
//  newTextBox.swift
//  TextAnimation
//
//  Created by dohankim on 2022/06/13.
//

import SwiftUI
import AVFoundation

struct newTextBox2: View {
    @Binding var control : Int
    @State var str = ""
    @State var StrArr : [String]
    @State var charArr : [String]
    @State var stringNumber = 0
    @State var toggle  = false
    @State var isClicked = false
    @State var isFinished = false
    @State var xPosition : CGFloat = UIScreen.main.bounds.width/2
    @State var yPosition : CGFloat = UIScreen.main.bounds.height/3
    
    var body: some View {
        ZStack{
           
            VStack{
                GeometryReader{geo in
                    
                    
                    if isClicked{
                        Text(!isClicked ? "동달" : charArr[stringNumber-1])
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .position(x: UIScreen.main.bounds.width/5
                                      , y: UIScreen.main.bounds.height/10 * 7)
                        
                        Text(str)
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(width: 250, height: 100, alignment: .leading)
                            .overlay(
                                TextBox()
                            )
                            .position(x: UIScreen.main.bounds.width/2
                                      , y: UIScreen.main.bounds.height/9 * 7)
                        if isFinished{
                            Button{
                                if stringNumber == 10 {
                                    print("fsdd")
                                    playSoundsnail(sound: "closet", type: "wav")
                                }
                                ges(strnum: stringNumber)
                                isClicked = true
                                if stringNumber < StrArr.count-1{
                                    stringNumber+=1
                                    
                                }
                                else if stringNumber == StrArr.count-1{
                                    isClicked = false
                                    control = 2
                                    
                                }
                                isFinished.toggle()
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
                    
                }
                
            }
            .onAppear(){
                if !isClicked{
                    ges(strnum: stringNumber)
                    isClicked = true
                    AudioServicesPlaySystemSound(1311)
                    if stringNumber < StrArr.count-1{
                        stringNumber+=1
                        
                    }
                    else if stringNumber == StrArr.count-1{
                        isClicked = false
                       
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


