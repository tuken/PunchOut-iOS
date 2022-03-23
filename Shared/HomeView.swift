//
//  HomeView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Image("common_logo")
            .scaledToFit()
        
        VStack {
            CalendarView()
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.showMenu = true
                    }
                }) {
                    Text("PUNCH ME IN")
                }
                .frame(width: 130, height: 50)
                .foregroundColor(.white.opacity(0.5))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white.opacity(0.5), lineWidth: 1/2)
                )
                .shadow(radius: 2)
                .padding()
                
                Button(action: {
                    withAnimation {
                        self.showMenu = true
                    }
                }) {
                    Text("PUNCH ME OUT")
                }
                .frame(width: 130, height: 50)
                .foregroundColor(.white.opacity(0.6))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white.opacity(0.5), lineWidth: 1/2)
                )
                .shadow(radius: 2)
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView(showMenu: .constant(false))
    }
}
