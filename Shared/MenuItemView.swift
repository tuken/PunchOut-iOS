//
//  MenuItemView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/30.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var main: MainViewModel

    var imageName = ""
    
    var title = ""
    
    var tag: String? = nil
    
    var destination: AnyView? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Image(systemName: self.imageName)
                    .foregroundColor(.gray)
                    .imageScale(.large)
                    .frame(width: 32, height: 32)
                
                Text(self.title)
                    .foregroundColor(.gray)
                    .font(.headline)
                
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
        .onTapGesture {
            self.main.showMenu = false
            self.main.destination = self.destination
            self.main.tag = self.tag
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MenuItemView()
    }
}
