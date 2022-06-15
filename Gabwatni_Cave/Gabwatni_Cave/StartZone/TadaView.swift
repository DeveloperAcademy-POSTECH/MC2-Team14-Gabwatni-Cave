//
//  TadaView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/14.
//

import SwiftUI
import AVFoundation

struct TadaView: View {
    let imageName : String
    @State var angle: Double = 0.0
    @State var isAnimating = false
    let rotate: Double
    
    var body: some View {
        ZStack {
            Image("backlight")
                .resizable()
                .frame(width: 330, height: 330)
                .opacity(0.1)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                .onAppear {
                    withAnimation(.linear(duration: 15.0)
                        .repeatForever(autoreverses: false)) {
                        self.isAnimating = true
                    }
                }
            
            Image("backlight2")
                .resizable()
                .frame(width: 280, height: 280)
                .opacity(0.7)
                .rotationEffect(Angle(degrees: self.isAnimating ? -360.0 : 0.0))
                .onAppear {
                    withAnimation(.linear(duration: 15.0)
                        .repeatForever(autoreverses: false)) {
                        self.isAnimating = true
                    }
                }
            Image(imageName)
                .resizable()
                .scaledToFit()
                .opacity(0.9)
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(rotate))
            
            
        }
        .onAppear {
            AudioServicesPlaySystemSound(1311)
        }
    }
        
}
