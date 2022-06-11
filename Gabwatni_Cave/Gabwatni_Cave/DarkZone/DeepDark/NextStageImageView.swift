//
//  NextStageImageView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/11.
//

import SwiftUI

struct NextStageImageView: View {
    var image: String
    var body: some View {
        Rectangle()
            .transition(AnyTransition.opacity.animation(.linear(duration: 2)))
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
    }
}

struct NextStageImageView_Previews: PreviewProvider {
    static var previews: some View {
        NextStageImageView(image: "deepDark")
    }
}
