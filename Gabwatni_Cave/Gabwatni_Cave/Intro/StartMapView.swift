//
//  StartMap.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/13.
//

import SwiftUI
import AVFoundation

struct StartMap: View {
    
    
   // @Binding var flow : Int
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            VStack{
                //                Text("뒤로가기")
                //                    .foregroundColor(.white)
                //                    .onTapGesture {
                //                        dismiss()
                //                    }
                
                ScrollView(.horizontal){
                    Image("worldmap2")
                        
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.8, alignment: .top)
            newTextBox3(StrArr: ["\"지도?\"","\"이게 뭐지?\"","(지도 사진을 스와이프하여 확인해 보세요.)","\"세계 각지에 흩어진 보물의 조각들을 모으면 원하는 소원을 들어주겠다...\"","\"뭐야... 장난치는 것도 아니고 이런게 왜 내 옷장에 있지?\"","\"아 참..\"","\"생각해 보니까 저번에 할아버지의 할아버지의 할아버지가 보물을 찾으러 가셨다가...\"","\"못 돌아오셨다는 이야기를 들은 것 같기도 하고?\"","\"근데 그게 사실이었다고?!\"","\"말도 안돼...\"","\"내가 진실을 밝혀내겠어 !!!\"","(말이 끝나기가 무섭게 최병호는 지도 속으로 빨려들어갔다.)","시작합니다.\n가봤니? - 동굴"," "],charArr: [" "," "," "," "," "," "," "," "," "," "," "," "," "])
            
        }
    }
}


struct newTextBox3: View {
    @EnvironmentObject var vm: CardViewModel2
    
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
                            if stringNumber < StrArr.count-1{
                                stringNumber+=1
                                
                            }
                            else if stringNumber == StrArr.count-1{
                                isClicked = false
                                withAnimation(.easeIn(duration: 2)) {
                                vm.flow += 1
                                }
                                
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
