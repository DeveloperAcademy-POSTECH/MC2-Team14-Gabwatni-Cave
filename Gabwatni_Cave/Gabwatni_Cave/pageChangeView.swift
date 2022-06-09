//
//  pageChangeView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/09.
//

import SwiftUI

struct pageChangeView: View {
    @State var flow = 0
    var body: some View {
       ZStack{
            if flow == 0{
            Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                .overlay(
                    Image("image 14")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
//                        .ignoresSafeArea()
                )
            
            Button{
                flow = 1
            }label: {
                Text("다음 스테이지")
                    .foregroundColor(.white)
            }
            }
            else if flow == 1{
                Rectangle()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        Image("image 1")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
//                            .ignoresSafeArea()
                    )
                HStack{
                Button{
                    flow = 0
                }label: {
                    Text("이전 스테이지")
                        .foregroundColor(.white)
                }
                    Button{
                        flow = 2
                    }label: {
                        Text("다음 스테이지")
                            .foregroundColor(.white)
                    }
                    
                }
            }
           else if flow == 2{
               
               Rectangle()
                   .edgesIgnoringSafeArea(.all)
                   .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
               
               
                   .overlay(
                       Image("image 2")
                           .resizable()
                           .scaledToFill()
                           .edgesIgnoringSafeArea(.all)
//                           .ignoresSafeArea()
                   )
            
               Button{
                   flow = 1
               }label: {
                   Text("이전 스테이지")
                       .foregroundColor(.white)
               }
                  
                   
               
               
           }
            

            }

        }
    }



struct pageChangeView_Previews: PreviewProvider {
    static var previews: some View {
        pageChangeView()
    }
}
