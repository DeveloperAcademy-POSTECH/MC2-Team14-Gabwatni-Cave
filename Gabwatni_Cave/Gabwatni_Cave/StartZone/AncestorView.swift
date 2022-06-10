//
//  AncestorView.swift
//  Gabwatni_Cave
//
//  Created by DongKyu Kim on 2022/06/09.
//

import SwiftUI
import Shimmer

struct AncestorView: View {
    @State private var imageScrollLocation: CGPoint = CGPoint(x: 500, y: 400)
    @State private var lightLocation: CGPoint = CGPoint(x: 400, y: 400)
    @State private var ancestorLocation: CGPoint = CGPoint(x: 650, y: 550)
    @State private var textboxState: Bool = false
    @State private var ancestorState: Bool = true
    @State var flow = 0
    
    var body: some View {
        if flow == 0 {
            StartZoneStartView
        } else if flow == 1 {
            AncestorPageView
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
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
        }
        
    }
    
    private var AncestorPageView: some View {
        ZStack {
            Rectangle()
                .transition(AnyTransition.opacity.animation(.easeIn(duration: 3)))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    ZStack {
                        Image("ancestor")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 1300)
                            .position(imageScrollLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3).delay(1)) {
                                    imageScrollLocation.x = 150
                                }
                                
                            }
                            .edgesIgnoringSafeArea(.all)
                        
                        ShimmeringItemView(imageName: "flashlight", count: 1, degreeNum: 50)
                            .frame(width: 30)
                            .position(lightLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3).delay(1)) {
                                    lightLocation.x = 50
                                }
                            }
                        
                        AncestorShimmeringView
                            .frame(width: 100)
                            .position(ancestorLocation)
                            .onAppear{
                                withAnimation(.easeIn(duration: 3).delay(1)) {
                                    ancestorLocation.x = 300
                                }
                                withAnimation(.easeIn(duration: 1).delay(5)) {
                                    textboxState.toggle()
                                }
                            }
                        
                        if textboxState == true {
                            ZStack {
                            Rectangle()
                                .frame(width: 200, height: 100, alignment: .center)
                            Text("헉, 이건 혹시 조상님의 흔적?")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                )

            HStack{
                Button{
                    lightLocation.x = 400
                    imageScrollLocation.x = 500
                    ancestorLocation.x = 650
                    textboxState.toggle()
                    //imageScrollLocation = CGPoint(x: 500, y: 400)
                    flow = 0
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
            ancestorState = false
            // count 증가
        } label: {
            Image("choi byung-ho")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shimmering(active: ancestorState, duration: 2.0)
        }
        .opacity(ancestorState ? 1 : 0.6)
        
    }
}

struct AncestorView_Previews: PreviewProvider {
    static var previews: some View {
        AncestorView()
    }
}
