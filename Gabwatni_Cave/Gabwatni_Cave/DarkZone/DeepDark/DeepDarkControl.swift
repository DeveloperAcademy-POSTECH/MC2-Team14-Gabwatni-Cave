//
//  DeepDarkControl.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/13.
//

import SwiftUI


struct DeepDarkControl: View {
    @State var deepDarkControl = -1
    var body: some View {
        if deepDarkControl == -1{
            DeepDarkView_start(flow: $deepDarkControl)
        }
        else if deepDarkControl == 0{
            DeepDarkView(flow: $deepDarkControl)
        }
        
    }
}

struct DeepDarkControl_Previews: PreviewProvider {
    static var previews: some View {
        DeepDarkControl()
    }
}