//
//  NextStageButtonView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct NextStageButtonView<Content: View>: View {
    var destinationView: Content
    
    @Binding var count: Int
    @Binding var nextCount: Int
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            Image("treasure chest")
        }
        .opacity(count >= nextCount && isShowing == false ? 1 : 0)
        //        Button {
        //            print("다음 방으로 가버렷~")
        //        } label : {
        //            Image("treasure chest")
        //        }.opacity(count >= nextCount ? 1 : 0)
        
    }
}
