//
//  newTextBox.swift
//  TextAnimation
//
//  Created by dohankim on 2022/06/13.
//

import SwiftUI
import AVFoundation

struct newTextBox: View {
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
        
            VStack{
                GeometryReader{geo in
                    //이미지 넣고싶으면  사용할 코드 --수정 필요함!!---------------------
//                    Button {
//                        print(isClicked)
//                        if !isClicked{
//                            ges(strnum: stringNumber)
//                            isClicked = true
//                            AudioServicesPlaySystemSound(1311)
//                            if stringNumber < 11{
//                                stringNumber+=1
//                                print(stringNumber)
//                            }
//                            else if stringNumber == 11{
//                                flow = 1
//                                print(1323)
//                            }
//                        }
//
//                    } label: {
//                        Image(!isClicked ? "동달" : charArr[stringNumber-1])
//                            .resizable()
//                            .scaleEffect(1.0)
//                            .frame(width: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/3: UIScreen.main.bounds.height/4, height: (!isClicked ? "동달" : charArr[stringNumber-1]) == "동달" ? UIScreen.main.bounds.height/3: UIScreen.main.bounds.height/4*2, alignment: .center)
//
//                    }
//                    .position(x: xPosition
//                              , y: yPosition)     //이미지 넣고 싶으면 사용할 코드 --수정 필요함!!--------------------------------
                   
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
                                if stringNumber < StrArr.count-1{
                                    stringNumber+=1
                                    print(stringNumber)
                                }
                                else if stringNumber == StrArr.count-1{
                                    isClicked = false
                                    print(1323)
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
                        print(stringNumber)
                    }
                    else if stringNumber == StrArr.count-1{
                       isClicked = false
                        print(1323)
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

struct newTextBox_Previews: PreviewProvider {
    static var previews: some View {
        newTextBox(StrArr: ["동달스","웰컴투 동달스","병호쓰~~"," "], charArr: ["동달이","동달이","최병호"," "])
    }
}
