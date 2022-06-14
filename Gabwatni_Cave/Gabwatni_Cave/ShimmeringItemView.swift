//
//  ShimmeringItemView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI
import Shimmer
import AVFoundation

struct ShimmeringItemView: View {
    @State private var isViewing: Bool = true
    @Binding var count: Int
    @Binding var isShowing: Bool
    
    private(set) var imageName: String
    private(set) var degreeNum: Double
    
    @Binding var showingImage: String
    
    var body: some View {
        Image(imageName)
            .shimmered(degreeNum: degreeNum)
            .onTapGesture {
                isShowing.toggle()
                isViewing = false
                count += 1
                showingImage = imageName
            }
            .opacity(isViewing ? 1 : 0)
    }
}

extension Image {
    func shimmered(degreeNum: Double) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(.degrees(degreeNum))
            .shimmering()
    }
}
