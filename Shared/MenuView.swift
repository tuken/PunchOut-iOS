//
//  MenuView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/22.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var main: MainViewModel
    
    @State private var showSettings = false
    
    var body: some View {
        
        VStack {
            
            Image("secual")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(30)
            
            HStack {
                
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
            .onTapGesture {
                self.main.showMenu = false
                self.main.destination = AnyView(SettingsView())
                self.main.tag = 8888
            }
            
            HStack {
                
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                
                Text("Logout")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
            
            Spacer()
            
            Text("Powerd by Secual Inc.")
                .foregroundColor(.gray)
                .font(.footnote)
                .padding(20)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MenuView()
            .environmentObject(MainViewModel())
    }
}
