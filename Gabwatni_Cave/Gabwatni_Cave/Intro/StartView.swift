//
//  StartView.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/13.
//

import SwiftUI

struct StartView: View {
    @Binding var flow : Int
    @State var textAnimation = false
    var body: some View {
        
        ZStack{
            Image("start")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .onTapGesture {
                    flow = 1
                }
               
            
            Text("가봤니?")
                .font(.custom("Sam3KRFont", size: 50))
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom,100)
            
            Button(action: {
                //버튼을 클릭했을 때 실행되는 코드
                flow = 1
                print("")
            }){
                //버튼의 보여지는 UI 코드
                Text("터치해서 시작하기")
                    .font(.custom("Sam3KRFont", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color("textcolor"))
                    .multilineTextAlignment(.center)
                    .padding(.top,30)
                    .opacity(textAnimation ? 1 : 0)
            }
            
        }
        .onAppear {
            playSound(sound: "start", type: ".mp3")
            withAnimation(.spring().repeatForever()) {
                textAnimation = true
            }
            
        }
    }
}


