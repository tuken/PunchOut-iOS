//
//  SettingsView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/28.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var main: MainViewModel

    var body: some View {

        ZStack {
//        Image("common_logo")
//            .scaledToFit()
        
        VStack {
            Text("Settings View")
        }
        }
}
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SettingsView()
    }
}
