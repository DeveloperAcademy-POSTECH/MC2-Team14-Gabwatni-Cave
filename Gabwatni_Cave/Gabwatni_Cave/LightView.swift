//
//  LightView.swift
//  TextField
//
//  Created by rbwo on 2022/06/14.
//

import SwiftUI

struct LightView: View {
    @EnvironmentObject var vm: CardViewModel2
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [Color(0xFFFFFF, alpha: 0.1), Color(0x000000, alpha: 1)]),
            center: .center,
            startRadius: -50,
            endRadius: 150
        )
        .frame(width: 10000, height: 10000)
        .offset(x: vm.dragOffset.width , y: vm.dragOffset.height)
        .gesture(DragGesture()
            .onChanged { gesture in
                vm.dragOffset = CGSize(width: gesture.translation.width + vm.dragOffset2.width, height: gesture .translation.height + vm.dragOffset2.height)
                
            }
                 //함수
                 //온체인지가 함수를 입력값으로 받는 메소드
            .onEnded { gesture in
                vm.dragOffset = CGSize(width: gesture.translation.width + vm.dragOffset2.width, height: gesture .translation.height + vm.dragOffset2.height)
                vm.dragOffset2 = vm.dragOffset
            })
        }
    }

