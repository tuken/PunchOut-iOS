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

            Color(red: 1/255, green: 172/255, blue: 200/255)
                .edgesIgnoringSafeArea(.all)
            
            Text("Settings View")
        }
        .navigationBarTitle("設定")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SettingsView()
    }
}
