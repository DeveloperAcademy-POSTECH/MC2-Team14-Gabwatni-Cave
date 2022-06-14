//
//  ContentView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello test")
            .padding()

//        오류났던 부분
//        if vm.flow == 0 {
//            AncestorView(mainflow: vm.flow)
//        }
//        #12    0x000000010065d498 in main ()
//        else if vm.flow == 1 {
//            EntranceControl()
//        }
//        else if vm.flow == 2 {
//            TwilightView(mainflow: vm.flow)
//        }
//        else if vm.flow == 3 {
//            DeepDarkControl(mainflow: vm.flow)
//        }
//        else if vm.flow == 4 {
//            Abyss()
//        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
