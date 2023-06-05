//
//  MyRewardsApp.swift
//  MyRewards
//
//  Created by Rifqie Tilqa Reamizard on 15/05/23.
//

import SwiftUI

@main
struct MyRewardsApp: App {
    @ObservedObject var appEnv: AppEnvironment = AppEnvironment()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appEnv.path) {
                ContentView().navigationDestination(for: Routes.self) { route in
                    ViewFactory.viewForDestination(route)
                }
            }.environmentObject(appEnv)
        }
    }
}
