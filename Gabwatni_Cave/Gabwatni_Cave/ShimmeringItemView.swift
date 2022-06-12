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
    @EnvironmentObject var twilightData : TwilightModel
    
    @State private var isViewing: Bool = true
    @Binding var count: Int
    @Binding var isShowing: Bool
    
    private(set) var imageName: String
    private(set) var degreeNum: Double
    
    @Binding var showingImage: String
    
    var body: some View {
        // 1번 방식 : Button으로 만든 방식
        //        Button {
        //            isViewing.toggle()
        //            count += 1
        //            print(count)
        //
        //            // 해당 요소에 맞는 View 보여주면 될 듯 ?
        //
        //        } label: {
        //            Image(imageName)
        //                .shimmered(degreeNum: degreeNum)
        //        }
        //        .opacity(isViewing ? 1 : 0)
        
        // 2번 방식 : Image에 클릭하는 제스쳐로 만든 방식
        Image(imageName)
            .shimmered(degreeNum: degreeNum)
            .onTapGesture {
                isShowing.toggle()
                twilightData.tabItem(str: imageName)
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
