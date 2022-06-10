//
//  DeepDarkView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI

struct DeepDarkView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                    .overlay(
                        Image("deepDark")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                        
                    )
                InventoryView(image: "minimap")
                
                
                
            }
            
        }
    }
}

struct DeepDarkView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDarkView()
    }
}
