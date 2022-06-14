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
                            .stroke(Color.white.opacity(0.7), lineWidth: 2)
                            .frame(width: 20, height: 20, alignment: .center)
                            .position(x: UIScreen.main.bounds.size.width * 6 / 7 + 8, y: UIScreen.main.bounds.size.height / 2 - 10)
                            .opacity(isViewing ? 0 : 1)
                    }
                    
                    
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
            
            // 해당 요소에 맞는 View 보여주면 될 듯 ?
        } label: {
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .rotationEffect(.degrees(degreeNum))
//                .frame(width: 50, height: 50)
//                .shimmering()
           
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
