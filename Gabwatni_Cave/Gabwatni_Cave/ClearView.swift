//
//  ClearView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/14.
//

import SwiftUI

struct ClearView: View {
    let size = UIScreen.main.bounds
    
    @State private var viewDidAppear: Bool = true
    
    var body: some View {
        Group {
            Image("clear view image")
                .resizable()
                .frame(width: size.width, height: size.height, alignment: .center)
                .scaledToFit()
                .ignoresSafeArea()
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                viewDidAppear.toggle()
            }
        }
        .opacity(viewDidAppear ? 0 : 1)
        .animation(.easeIn, value: viewDidAppear)
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView()
    }
}
