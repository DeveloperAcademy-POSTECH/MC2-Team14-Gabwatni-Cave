//
//  InventoryView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/10.
//

import SwiftUI

struct InventoryView: View {
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    @State var transitionView: Bool = false
    var image: String
    var body: some View {
        GeometryReader { geometry in
        Button{
            withAnimation{
                transitionView.toggle()}
        }label: {
            Text("가방")
                .foregroundColor(.black)
                
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment:.topTrailing)
        
        if transitionView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width/1.3, height: geometry.size.height/1.2, alignment: .center)
                    .position(x:geometry.size.width/2 , y: geometry.size.height/2)
                HStack{
                Image("worldmap2")
                    .resizable()
                    .frame(width: geometry.size.width/3, height: geometry.size.height/6).onTapGesture {
                        showSheet2.toggle()
                    }
                    .fullScreenCover(isPresented: $showSheet2, content:{ worldMapView()})

                    
                    
                    
                    Image(image)
                        .resizable()
                        .frame(width: geometry.size.width/3, height: geometry.size.height/6)
                        .onTapGesture {
                            showSheet.toggle()
                        }
                        .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView(image: image)})
                }
                
                
                    
                
       
            }
        }
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(image: "minimap")
    }
}
