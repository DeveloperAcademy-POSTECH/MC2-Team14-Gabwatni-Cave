//
//  IntroControl.swift
//  Gabwatni_Cave
//
//  Created by 전호정 on 2022/06/13.
//

import SwiftUI

struct IntroControl: View {
    @State var flow : Int
    var body: some View {
        if flow == 1 {
            StartView()
        }
        else if flow == 2 {
            CharacterView()
        }
    }
}



