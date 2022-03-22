//
//  MainView.swift
//  Shared
//
//  Created by 井川 司 on 2022/03/21.
//

import SwiftUI

struct MainView: View {
    
    @State var showMenu = false

    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    HomeView(clock: self.clock, showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
#if !os(macOS)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
            ))
#endif
            .background(Color(red: 1/255, green: 172/255, blue: 200/255))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
    }
}
