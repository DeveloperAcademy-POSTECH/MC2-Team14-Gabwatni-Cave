//
//  DeathView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct DeathView: View {
    @State private var reasonText = "가스 중독으로 인한"
    private var deathText = "사망"
    @State private var tipText = "동굴에서는 이런 이유로 \n 죽을 수 있습니다."
    
    private var restartText = "터치해서 다시하기"
    
    var body: some View {
        ZStack{
            // image 넣으면 될듯
            // font도 넣어야 함
            Color.gray
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text(reasonText)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .font(.title3)
                    
                Text(deathText)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .font(.title)
                
                Text(tipText)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Button {
                    print("restart")
                } label: {
                    Text(restartText)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }

                Spacer()
            }
        }
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView()
    }
}
