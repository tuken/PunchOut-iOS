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
        
        Image("common_logo")
            .scaledToFit()
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SettingsView()
    }
}
