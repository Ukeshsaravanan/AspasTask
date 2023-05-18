//
//  AspasTaskApp.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 17/05/23.
//

import SwiftUI

@main
struct AspasTaskApp: App {

    var body: some Scene {
        WindowGroup {
            NumberView( viewModel: UserViewModel())
        }
    }
}
