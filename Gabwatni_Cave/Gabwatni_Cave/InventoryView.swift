////
////  InventoryView.swift
////  Gabwatni_Cave
////
////  Created by 이창형 on 2022/06/10.
////
//
//import SwiftUI
//
//struct InventoryView: View {
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
//    @State var transitionView: Bool = false
//    var image: String
//    
//    var body: some View {
//        GeometryReader { geometry in
//            Button{
//                withAnimation{
//                    transitionView = true}
//            }label: {
//                Image("backpack")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50)
//            }
//            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment:.topTrailing)
//            
//            if transitionView {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 20)
//                        .ignoresSafeArea()
//                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height/3, alignment: .center)
////                        .position(x:geometry.size.width/2 , y: geometry.size.height/4)
//                    VStack{
//                        Button{
//                            transitionView = false
//                        }label: {
//                            Text("뒤로가기")
//                                .foregroundColor(.white)
//                        }
//                    HStack{
//                        Image("worldmap2")
//                            .resizable()
//                            .frame(width: geometry.size.width/4, height: geometry.size.height/8).onTapGesture {
//                                showSheet2.toggle()
//                            }
//                            .fullScreenCover(isPresented: $showSheet2, content:{ worldMapView()})
//                        Image(image)
//                            .resizable()
//                            .frame(width: geometry.size.width/4, height: geometry.size.height/8)
//                            .onTapGesture {
//                                showSheet.toggle()
//                            }
//                            .fullScreenCover(isPresented: $showSheet, content:{ MiniMapView(image: image)})
//                        
//
//                    }
//                    }
//                    
//                    
//                    
//                }.padding()
//            }
//        }
//    }
//}
//
//struct InventoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        InventoryView(image: "minimap")
//    }
//}
