//
//  ContentView.swift
//  MyRewards
//
//  Created by Rifqie Tilqa Reamizard on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appEnv: AppEnvironment
    var body: some View {
        VStack {
        }.onAppear {
            appEnv.pushTo(Routes.onboarding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
