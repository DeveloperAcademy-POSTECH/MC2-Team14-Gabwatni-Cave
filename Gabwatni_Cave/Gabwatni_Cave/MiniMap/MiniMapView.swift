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
    var myPosition: String
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
            
            VStack{
                Image("xicon")
                    .onTapGesture {
                        dismiss()
                    }
                    .frame(maxWidth:.infinity, alignment: .topTrailing)
                    .padding()
                ScrollView(.horizontal){
                    Image(image)
                        .resizable()
                        .scaledToFit()
                    
                    
                }
                
                Text(myPosition)
                    .foregroundColor(.white)
                    .font(.custom("Sam3KRFont", size: 20))
                
                
            }
        }
    }
}



struct MiniMapView_Previews: PreviewProvider {
    static var previews: some View {
        MiniMapView(image: "minimap", myPosition: "d아")
    }
}
