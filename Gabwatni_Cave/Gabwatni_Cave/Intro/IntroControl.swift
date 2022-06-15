//
//  IntroControl.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/13.
//

import SwiftUI

struct IntroControl: View {
    @State var flow = -1
    var body: some View {
        if flow == -1{
            SoundCautionView(flow: $flow)
        }
        else if flow == 0 {
            StartView(flow: $flow)
        }
        else if flow == 1 {
            CharacterView(flow: $flow)
        }
        else if flow == 2 {
            StartMap()
        }
    }
}

struct IntroControl_Previews: PreviewProvider {
    static var previews: some View {
        IntroControl()
    }
}
