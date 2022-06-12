//
//  ItemDetailView.swift
//  Gabwatni_Cave
//
//  Created by rbwo on 2022/06/11.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var twilightData: TwilightModel
    
    let imageName: String
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack{
            Image(imageName)
                .shimmered(degreeNum: 30)
                .opacity(isShowing ? 1 : 0)
                .onTapGesture {
                    isShowing = false
                }
            
            Text(twilightData.itemTitle)
                .font(.title)
                .foregroundColor(.white)
            
            ForEach(twilightData.itemData, id:\.self) { data in
                Text(data)
                    .lineSpacing(10)
                    .font(.title2)
                    .foregroundColor(.white)
            }
        
        }
    }
    
}
