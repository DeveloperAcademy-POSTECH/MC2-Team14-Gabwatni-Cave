//
//  EntranceView-stone.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI

struct EntranceView_stone: View {
   @Binding var flow : Int
    var body: some View {
        ZStack{
            Image("entrancecave")
                .resizable()
                .ignoresSafeArea()
            Color.black.opacity(0.7)
            .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    ShimmeringItemView_entran(imageName: "최병호", count: 1, degreeNum: 10,flow: $flow)
                    .padding()
                    
                }
                Spacer()
            }
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
            print(count)
            // 해당 요소에 맞는 View 보여주면 될 듯 ?
        } label: {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(degreeNum))
                .frame(width: 50, height: 50)
                .shimmering()
        }
        .opacity(isViewing ? 1 : 0)
    }
}
