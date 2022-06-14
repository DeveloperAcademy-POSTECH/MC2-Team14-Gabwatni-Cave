//
//  ContentView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm : CardViewModel2
    
    var body: some View {
        if vm.flow == 0 {
            AncestorView(mainflow: vm.flow)
        }
        else if vm.flow == 1 {
            EntranceControl()
        }
        else if vm.flow == 2 {
            Dongdalsays()
        }
        else if vm.flow == 3 {
            DeepDarkControl(mainflow: vm.flow)
        }
        else if vm.flow == 4 {
            Abyss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
