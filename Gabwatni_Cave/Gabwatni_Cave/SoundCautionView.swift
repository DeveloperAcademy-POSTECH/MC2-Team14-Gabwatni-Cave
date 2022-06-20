//
//  SoundCautionView.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/15.
//

import SwiftUI

struct SoundCautionView: View {
    @Binding var flow : Int
    @State var toggle1 = false
    @State var toggle2 = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
                Image("soundsnail")
                .position(x: UIScreen.main.bounds.width/6*4, y:UIScreen.main.bounds.height/3 )
            if(toggle1){
                Text("*  원활한 플레이를 위해  *").foregroundColor(.white).font(.custom("Sam3KRFont", size: 24))
                        .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/20*12)
            }
            if toggle2{
                Text("*  이어폰 착용을 권장합니다. *").foregroundColor(.white).font(.custom("Sam3KRFont", size: 24))
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/20*13)
                  
            }
            
               
            
            
        }
        
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false){(timer) in
                withAnimation {
                    toggle1.toggle()
                }

            }
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false){(timer) in
                withAnimation {
                    toggle2.toggle()
                }

            }
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false){(timer) in
                withAnimation {
                    flow = 0
                }
                
            }
        }
        
    }
}


