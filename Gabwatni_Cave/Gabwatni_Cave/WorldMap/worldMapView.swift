//
//  worldMapView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/10.
//

import SwiftUI

struct worldMapView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
            
            VStack{
//                Text("뒤로가기")
//                    .foregroundColor(.white)
//                    .onTapGesture {
//                        dismiss()
//                    }
                Button{
                    dismiss()
                }label: {
                    Text("뒤로가기")
                }
                ScrollView(.horizontal){
                Image("worldmap2")
                    .resizable()
                    .scaledToFit()
                    
            
                
                }
                
                Text("안녕하세요")
                    .foregroundColor(.white)
                
                
            }
            }
    }
}

struct worldMapView_Previews: PreviewProvider {
    static var previews: some View {
        worldMapView()
    }
}
