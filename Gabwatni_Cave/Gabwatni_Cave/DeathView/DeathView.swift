//
//  DeathView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct DeathView: View {
    private(set) var reasonText: String
    let deathText: String = "사망"
    
    private(set) var tipText: String
    let restartText: String = "터치해서 다시하기"
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack{
            Image("DeathView")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
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
                
                Spacer()
                
                // 어떤식으로 뷰를 넘어가게 할지 ?
                NavigationLink {
//                    EntranceView()
                } label: {
                    Text(restartText)
                        .font(.custom("Sam3KRFont", size: 24))
                        .foregroundColor(.red)
                }
                Spacer()
            }
        }
    }
}
