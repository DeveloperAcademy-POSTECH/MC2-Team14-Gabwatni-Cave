//
//  MiniMapView2.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/15.
//

import SwiftUI

struct WorldMapView2: View {
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
                //Text("뒤로가기")
                //  .foregroundColor(.white)
                //.onTapGesture {
                //  dismiss()
                //}
                ScrollView(.horizontal){
                    Image(image)
                        .resizable()
                        .scaledToFit()
                    
                    
                }
                
                ZStack{
                    Image("textbox")
                    
                    Text(myPosition)
                        .font(.custom("Sam3KRFont", size: 20))
                        .foregroundColor(.white)
                    
                    
                }
            }
            
        }
    }
}

struct WorldMapView2_Previews: PreviewProvider {
    static var previews: some View {
        WorldMapView2(image: "worldmap3", myPosition: "다음 모험을 떠나볼까...")
    }
}
