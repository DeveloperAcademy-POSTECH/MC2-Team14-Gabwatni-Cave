//
//  MiniMapView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI

struct MiniMapView: View {
    
    //    @Binding var showSheet: Bool
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
            
            VStack{
                ScrollView(.horizontal){
                Image("minimap")
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
        MiniMapView()
    }
}
