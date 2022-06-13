//
//  StartView.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/13.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack{
            Image("start")
                .padding(.bottom)
                .scaledToFit()
            
            Text("가봤니?")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom,100)
            
            Button(action: {
                       //버튼을 클릭했을 때 실행되는 코드
                       print("")
                   }){
                       //버튼의 보여지는 UI 코드
                       Text("터치해서 시작하기")
                           .font(.body)
                           .fontWeight(.bold)
                           .foregroundColor(Color(hue: 0.082, saturation: 0.306, brightness: 0.312))
                           .multilineTextAlignment(.center)
                           .padding(.top,30)
                   }
            
        }
    }
}

struct Start_View_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
