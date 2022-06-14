//
//  NextStageButtonView.swift
//  Mc2-Niber
//
//  Created by rbwo on 2022/06/09.
//

import SwiftUI

struct NextStageButtonView: View {
    @Binding var count: Int
    @Binding var nextCount: Int
    @Binding var isShowing: Bool
    @Binding var mainflow: Int
    
    var body: some View {
        Button {
            // flow를 늘려서 해도 될거같고~
            isShowing = false
            mainflow = 3
            
        } label : {
            Image("footprint")
                .resizable()
                .frame(width: 300, height: 300)
        }//.opacity(count >= nextCount && isShowing ? 1 : 0)
        .opacity(count >= nextCount ? 1 : 0)
        
    }
}
