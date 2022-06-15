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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .preferredColorScheme(.light)
                .onAppear {
                            //세로모드 고정
                            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                            AppDelegate.orientationLock = .portrait
                        }.onDisappear {
                            AppDelegate.orientationLock = .all
                        }

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
