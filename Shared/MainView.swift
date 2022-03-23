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
                    HomeView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                }
                .gesture(drag)
                
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width*4/5, height: geometry.size.height)
                        .transition(.move(edge: .leading))
                }
            }
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
            .background(Color(red: 1/255, green: 172/255, blue: 200/255))
            .navigationBarColor(Color(red: 1/255, green: 172/255, blue: 200/255))
        }
    }
}

struct NavigationBarModifier: ViewModifier {
    
    let backgroundColor: Color

    init(backgroundColor: Color) {
        
        self.backgroundColor = backgroundColor

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {

    func navigationBarColor(_ backgroundColor: Color) -> some View {
        
        modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
    }
}
