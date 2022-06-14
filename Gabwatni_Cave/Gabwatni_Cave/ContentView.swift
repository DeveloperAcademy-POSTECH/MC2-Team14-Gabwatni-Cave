//
//  ContentView.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    @State var mainflow = 0
    
    var body: some View {

        if mainflow == 0 {
            AncestorView(mainflow: $mainflow)
        }
        else if mainflow == 1 {
            EntranceControl(mainflow: $mainflow)
        } else if mainflow == 2 {
            TwilightView(mainflow: $mainflow)
        } else if mainflow == 3 {
            DeepDarkControl(mainflow: $mainflow)
        } else if mainflow == 4 {
            Abyss()
        }
        
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
