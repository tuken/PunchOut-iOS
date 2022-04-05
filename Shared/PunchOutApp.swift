//
//  PunchOutApp.swift
//  Shared
//
//  Created by 井川 司 on 2022/03/21.
//

import SwiftUI

@main
struct PunchOutApp: App {
    
    @State var isSplashing = true

    var body: some Scene {
        
        let main = MainViewModel()
        
        WindowGroup {
            
            if isSplashing {
                
                SplashView(isSplashing: $isSplashing)
            }
            else {
                MainView()
                    .environmentObject(main)
            }
        }
    }
}
