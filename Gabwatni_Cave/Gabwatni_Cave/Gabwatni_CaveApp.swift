//
//  Gabwatni_CaveApp.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

@main
struct Gabwatni_CaveApp: App {
    @StateObject private var vm = CardViewModel2()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
