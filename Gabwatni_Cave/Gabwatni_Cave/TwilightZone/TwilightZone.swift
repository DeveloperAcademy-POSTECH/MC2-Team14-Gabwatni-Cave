//
//  TwilightZone.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/10.
//

import SwiftUI

struct TwilightZone: View {
    private var zoneText: String = "Twilight Zone"
    private var zoneDescribe: String = "빛과 어둠이\n 만나는 곳"
    
    @State private var nextView: Bool = false
    
    var body: some View {
        if nextView {
            TwilightView()
                .animation(.easeOut(duration: 0.8))
                //.transition(AnyTransition.scale.animation(.easeInOut(duration: 1)))
        } else {
            ZStack{
                Image("FirstTwilight")
                    .ignoresSafeArea()
                VStack{
                    Text(zoneText)
                        .font(.title3)
                        .foregroundColor(.white)
                    Text(zoneDescribe)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                withAnimation {
                    nextView.toggle()
                }
            }
        }
    }
}

struct TwilightZone_Previews: PreviewProvider {
    static var previews: some View {
        TwilightZone()
    }
}
