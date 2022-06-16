//
//  EntranceView-stone.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI

struct EntranceView_stone: View {
   @Binding var flow : Int
    @State var isViewing: Bool = false
    @State private var animationAmount: CGFloat = 1
    @State var showSheet = false
    var body: some View {
        ZStack{
            Image("entrancecave")
                .resizable()
                .ignoresSafeArea()
            Color.black.opacity(0.4)
            .ignoresSafeArea()
            VStack{
                HStack{
                    
                    Button{
                        flow = 2
                        isViewing.toggle()
                    }label: {
                        Circle()
                            .inset(by: 0)
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 20, height: 20, alignment: .center)
                            .opacity(isViewing ? 0 : 1)
                    }
                    .overlay(
                               Circle()
                                   .stroke(Color.white, lineWidth: 2)
                                   .scaleEffect(animationAmount)
                                   //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                                   .opacity(Double(2 - animationAmount))
                                   .animation(Animation.easeInOut(duration: 1.3)
                                               .repeatForever(autoreverses: false)))

                    .position(x: UIScreen.main.bounds.size.width * 6 / 7 + 8, y: UIScreen.main.bounds.size.height / 2 - 10)

                    
                }
                Spacer()
            }
            Image("mapIcon")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/12)
                .onTapGesture {
                    playSoundEffect(sound: "mapGain", type: ".wav")
                    showSheet.toggle()
                }
                .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView(image: "minimap", myPosition: "현재 위치: 모험의 시작")})
                .position(x: 360, y: 15)
            
        }.onAppear(){
            self.animationAmount = 2
        }
        
    }
}

struct ShimmeringItemView_entran: View {
    // @EnvironmentObject var data : dataModel
    @State var imageName: String
    @State var count: Int
    @State var degreeNum: Double
    
    @State private var isViewing: Bool = true
    @Binding var flow : Int
    var body: some View {
        Button {
            flow = 2
            isViewing.toggle()
            count += 1
            
            // 해당 요소에 맞는 View 보여주면 될 듯 ?
        } label: {

                Circle()
                .foregroundColor(.clear)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
                .rotationEffect(.degrees(degreeNum))
                .frame(width: 50, height: 50)
                .shimmering()
        }
        .opacity(isViewing ? 1 : 0)
    }
}
