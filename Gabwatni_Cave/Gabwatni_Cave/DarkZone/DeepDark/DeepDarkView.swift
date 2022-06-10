//
//  DeepDarkView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI

struct DeepDarkView: View {
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    @State var transitionView: Bool = false
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                .overlay(
                    Image("deepDark")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                )
        
                
                    Button{
                        withAnimation{
                            transitionView.toggle()}
                    }label: {
                        Text("가방")
                            .foregroundColor(.white)
                            
                    }
                    .padding()
                    .frame(maxWidth:.infinity, maxHeight: .infinity, alignment:.topTrailing)
                    
                
              
                //ZStack{
                if transitionView {
                    ZStack{
                        Rectangle()
                            .ignoresSafeArea()
                            .frame(width: geometry.size.width/1.3, height: geometry.size.height/1.2, alignment: .center)
                            .position(x:geometry.size.width/2 , y: geometry.size.height/2)
                        HStack{
                        Image("worldmap")
                            .resizable()
                            .frame(width: geometry.size.width/3, height: geometry.size.height/6).onTapGesture {
                                showSheet2.toggle()
                            }
                            .fullScreenCover(isPresented: $showSheet2, content:{ worldMapView()})

                            
                            
                            
                            Image("minimap")
                                .resizable()
                                .frame(width: geometry.size.width/3, height: geometry.size.height/6)
                                .onTapGesture {
                                    showSheet.toggle()
                                }
                                .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView()})
                        }
                        
                        
                            
                        
               
                    }
                }
            
            
            
        }
        
        }
    }
}

struct DeepDarkView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDarkView()
    }
}
