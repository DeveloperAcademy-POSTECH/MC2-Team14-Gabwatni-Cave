//
//  EntranceView-start.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/12.
//

import SwiftUI

struct EntranceView_start: View {
    @Binding var flow : Int
    @State var isVisible = false
    var body: some View {
        ZStack{
            Image("entrancetitle")
                 .resizable()
                 .ignoresSafeArea()
            if isVisible{
                VStack{
                    Text("Entrance Zone")
                        .foregroundColor(.white)
                        .font(.custom("Sam3KRFont", size: 25))
                        .padding(.bottom, 6.0)
                    Text("모험의 시작")
                        .foregroundColor(.white)
                        .font(.custom("Sam3KRFont", size: 40))
                        
                }.transition(.opacity)            }
                    }
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){(timer) in
                withAnimation {
                    isVisible.toggle()
                }
            }
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false){(timer) in
                withAnimation {
                    flow = 0
                }
            }
            
            
            
        }
       
        
    }
}

