//
//  Gabwatni_CaveApp.swift
//  Gabwatni_Cave
//
//  Created by 이창형 on 2022/06/08.
//

import SwiftUI

@main
struct Gabwatni_CaveApp: App {
    @StateObject var viewModel = QuizModel()
    
    var body: some Scene {
        WindowGroup {
                EntranceControl()
//            QuizView()
//                .environmentObject(viewModel)

        }
    }
}
