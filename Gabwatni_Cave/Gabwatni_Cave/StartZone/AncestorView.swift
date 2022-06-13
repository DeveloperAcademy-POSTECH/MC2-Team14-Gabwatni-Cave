//
//  AncestorView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI
import Shimmer
import AVFoundation

struct AncestorView: View {
    @State private var imageScrollLocation: CGPoint = CGPoint(x: 500, y: 400)
    @State private var lightLocation: CGPoint = CGPoint(x: 400, y: 400)
    @State private var ancestorLocation: CGPoint = CGPoint(x: 650, y: 500)
    
    @State private var textboxState: Bool = false
    @State private var ancestorState: Bool = true
    @State private var cardViewState: Bool = false
    
    @State private var flow = 0
    @State private var count = 0
    
    @State private var str = ""
    @State private var str2 = "조상님의 지도 발견!"
    
    @State private var presentView: Bool = false
    @State private var showingImage: String =  ""
    
    var body: some View {
        ZStack {
        if flow == 0 {
            StartZoneStartView
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeInOut(duration: 2)) {
                            flow = 1
                        }
                             }
                }
        } else if flow == 1 {
            AncestorPageView
        }
        
        if cardViewState {
            CardView(imageName: "dongdal", cardState: $cardViewState)
            }
        }
    }
    
    private var StartZoneStartView: some View {
        ZStack {
            Rectangle()
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 3)))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Image("startzone")
                        .resizable()
                        .scaledToFill()
                )
            
            Button{
                withAnimation(.easeIn) {
                    flow = 1
                }
            } label: {
                Text("조상님의 안식처")
                    .font(.custom("Sam3KRFont", size: 40))
                    .foregroundColor(.white)
            }
        }
        
    }
    
    private var AncestorPageView: some View {
        ZStack {
            Rectangle()
                .transition(AnyTransition.opacity.animation(.easeIn(duration: 2)))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    ZStack {
                        Image("ancestor")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 1300)
                            .position(imageScrollLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3)) {
                                    imageScrollLocation.x = 150
                                }
                                
                            }
                            .edgesIgnoringSafeArea(.all)
                        
                        ShimmeringItemView(count: $count, isShowing: $presentView, imageName: "flashlight", degreeNum: 50, showingImage: $showingImage)
                            .frame(width: 30)
                            .position(lightLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3)) {
                                    lightLocation.x = 50
                                }
                            }
                        
                        AncestorShimmeringView
                        
                        if textboxState == true {
                            textBox(name: "최병호", text: str)
                                .onAppear {
                                    ges()
                                }
                        }
                    }
                )
                .onDisappear {
                    lightLocation.x = 400
                    imageScrollLocation.x = 500
                    ancestorLocation.x = 650
                }

            HStack{
                Button{
                    withAnimation(.easeIn) {
                    cardViewState.toggle()
                    }
                }label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.white)
                }
            }
            .position(x: 300, y: 700)
        }
    }
    
    private var AncestorShimmeringView: some View {
        Button {
            withAnimation(.easeInOut) {
                textboxState = true
                ancestorState = false
            }
            // count 증가
        } label: {
            if ancestorState {
                Image("skeletonMapO")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //.shimmering(active: ancestorState, duration: 2.0)
            } else {
                Image("skeletonMapX")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: 200, height: 200)
        .position(ancestorLocation)
        .onAppear{
            withAnimation(.easeIn(duration: 3)) {
                ancestorLocation.x = 300
            }
        }
    }
    
    func ges(){
        str = ""
        let length = str2.count
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            AudioServicesPlaySystemSound(1306)
            str += String(str2[str2.index(str2.startIndex, offsetBy: index)])
            index+=1
            if index == length{
                timer.invalidate()
            }
        }
    }
}

struct AncestorView_Previews: PreviewProvider {
    static var previews: some View {
        AncestorView()
    }
}
