//
//  Character View.swift
//  practice
//
//  Created by 전호정 on 2022/06/12.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        ZStack{
            
            Image("start")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
            
            Image("choi byung-ho")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom,200)
                .frame(width: 200, height: 300)
            
            
            
            ZStack{
            Text("최병호(29, 무직백수)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top,450.0)
                .frame(height: -1.0)
            
            Text("가문의 비밀이 담긴 보물지도를 발견하고")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top,550)
            
            Text("소원을 이루기 위해 모험을 떠나게 된다...")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top,600)
            }
            
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
