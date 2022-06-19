//
//  CaveDeathView.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/15.
//

import SwiftUI
import AVFoundation

struct CaveDeathView: View {
    @Binding var isEnd : Bool
    
    @State var str = ""
    @State var StrArr : [String] = ["엄청 좁은 길이니까 조심하시게.","알아서 할게..요~ 따라 오기나해요", "억! 저 손전등을 놓쳤어요!","(쿠당탕탕)","빨리 줍지않고 뭐하는것이오! 아무것도 보이지않소!","근데 저 틈에 몸이 낀 것 같아요...","몸이 움직여지지 않는가??","네 힘을 더 줬다간 다리가 부러질거같아요...","내가 가지말라 하지 않았소...","저 좀 구해주면 안될까요?(눈물)","미안하네 내가 뭘 해 줄수가 없구먼...","정말 미안하네.","피는 못속이는구먼... 다시 후손을 기다려야겠어.","동달!! 어디갔어요 저 두고 가는거에요...?","(동굴에는 고요한 적막만이 흘렀다...)"," "]
    @State var charArr : [String] = ["동달","최병호", "최병호"," " ,"동달","최병호","동달","최병호","동달","최병호","동달","동달","동달","최병호"," "," " ]
    @State var stringNumber = 0
    @State var toggle  = false
    @State var isClicked = false
    @State var isFinished = false
    @State var xPosition : CGFloat = UIScreen.main.bounds.width/2
    @State var yPosition : CGFloat = UIScreen.main.bounds.height/3
    @Binding var realDie: Bool
    
    var body: some View {
        if !isEnd {
            CaveDeathView2(reasonText: "동달의 말을 듣지 않아서", tipText: "동굴에는 좁은 틈이 많습니다.\n주의 합시다.", realDie: $realDie)
        }
        else {
        ZStack{
            
            Color.black.opacity(1)
            .ignoresSafeArea()
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
                                ges(strnum: stringNumber)
                                isClicked = true
                                if stringNumber < 15{
                                    stringNumber+=1
                                    
                                }
                                else if stringNumber == 15{
                                    isClicked.toggle()
                                    isEnd.toggle()
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
            
            
        }
        .onAppear(){
            if !isClicked{
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){(timer) in
                   
                    
                }
                
                ges(strnum: stringNumber)
                isClicked = true
                AudioServicesPlaySystemSound(1311)
                if stringNumber < 15{
                    stringNumber+=1
                    
                }
                else if stringNumber == 15{
//                                flow = 1
                    
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
        
    



