//
//  DeepDarkView-start.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/13.
//

import SwiftUI

import SwiftUI

struct DeepDarkView_start: View {
    @Binding var flow : Int
    @State var isVisible = false
    var body: some View {
        ZStack{
            Image("pitch-black room")
                 .resizable()
                 .ignoresSafeArea()
            if isVisible{
                VStack{
                    Text("Dark Zone")
                        .foregroundColor(.white)
                        .font(.custom("Sam3KRFont", size: 25))
                        .padding(.bottom, 6.0)
                    Text("칠흑의 방")
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

