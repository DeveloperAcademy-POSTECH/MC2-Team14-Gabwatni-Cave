//
//  DeathView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct DeathView: View {
    @State var textAnimation = false
    @EnvironmentObject var vm : CardViewModel2
    
    private(set) var reasonText: String = "가위 바위 보 져서"
    let deathText: String = "사망"
    
    private(set) var tipText: String = "다음엔 더 잘해보시길"
    let restartText: String = "터치해서 다시하기"
    
    @State var count: Int = 0
    
    @State var isTouchAble = false
    
    var body: some View {
        ZStack{
            Image("DeathView")
                .ignoresSafeArea()
                .onTapGesture {
                    vm.isTouchable = false
                    vm.flow = 3
                }
            
            VStack(alignment: .center) {
                Spacer()
                
                Text(reasonText)
                    .font(.custom("Sam3KRFont", size: 24))
                    .foregroundColor(.red)
                    
                Text(deathText)
                    .font(.custom("Sam3KRFont", size: 42))
                    .foregroundColor(.red)
                    .padding(.bottom)
                
                Text(tipText)
                    .font(.custom("Sam3KRFont", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Text(restartText)
                    .font(.custom("Sam3KRFont", size: 24))
                    .foregroundColor(.red)
                    .opacity(textAnimation ? 1 : 0)
                        
                
                
                // TODO: 일단 다시하기 누르면 맨 처음으로 돌아가는 걸로 설정해놨습니다.

                
                Spacer()
            }
        }
        .onAppear{
            playSound(sound: "start", type: ".mp3")
            withAnimation(.spring().repeatForever()) {
                textAnimation = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                isTouchAble = true
            }
        }.allowsHitTesting(isTouchAble)
    }
}
