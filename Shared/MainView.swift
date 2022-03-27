//
//  MainView.swift
//  Shared
//
//  Created by 井川 司 on 2022/03/21.
//

import SwiftUI

struct MainView: View {
    
    @State var showMenu = false
    
    @State var position =  CGPoint.zero
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                GeometryReader { geometry in
                    
                    HomeView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        //                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                    .onChanged { val in
                                        if self.showMenu {
                                            self.position = val.location
                                        }
                                    }
                                    .onEnded {_ in
                                        if self.showMenu {
                                            if self.position.x > geometry.size.width*4/5 {
                                                self.showMenu.toggle()
                                            }
                                        }
                                    })
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
            
            if self.showMenu {
                GeometryReader { geometry in
                    
                    MenuView()
                        .frame(width: geometry.size.width*4/5, height: geometry.size.height)
                        .transition(.move(edge: .leading))
                        .gesture(DragGesture()
                                    .onEnded {
                                        if $0.translation.width < -100 {
                                            withAnimation {
                                                self.showMenu.toggle()
                                            }
                                        }
                                    })
                }
            }
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
