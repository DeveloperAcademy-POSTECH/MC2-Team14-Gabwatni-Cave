//
//  ShimmerItemView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI
import Shimmer

struct ShimmerItemView: View {
    // @EnvironmentObject var data : dataModel
    
    @State private var count: Int = 0
    @State private var isViewing: Bool = true
    
    var body: some View {
        ZStack{
            Image("cave-94193 2")
                .ignoresSafeArea()
            
                Button {
                    print("다음 방으로 가버렷~")
                } label : {
                    Image("arrow")
                        
                }.opacity(count >= 1 ? 1 : 0)
                .position(x: UIScreen.main.bounds.width * 0.95, y: UIScreen.main.bounds.height / 2)
                
                Button {
                    isViewing.toggle()
                    count += 1
                    print(count)
                    // 해당 요소에 맞는 View 보여주면 될 듯 ?
                } label: {
                    Image("flashlight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .shimmering()
                }
                .opacity(isViewing ? 1 : 0)
                .position(x: UIScreen.main.bounds.width / 3.5, y: UIScreen.main.bounds.height / 1.4)
        }
        
    }
}

struct ShimmerItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerItemView()
    }
}
