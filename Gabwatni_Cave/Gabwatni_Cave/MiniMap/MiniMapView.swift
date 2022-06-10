//
//  MiniMapView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI

struct MiniMapView: View {
    @Environment(\.dismiss) private var dismiss
    //    @Binding var showSheet: Bool
    var image: String
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
            
            VStack{
                Text("뒤로가기")
                    .foregroundColor(.white)
                    .onTapGesture {
                        dismiss()
                    }
                ScrollView(.horizontal){
                Image(image)
                    .resizable()
                    .scaledToFit()
            
                
                }
                
                Text("안녕하세요")
                    .foregroundColor(.white)
                
                
            }
            }
    }
}



struct MiniMapView_Previews: PreviewProvider {
    static var previews: some View {
        MiniMapView(image: "minimap")
    }
}
