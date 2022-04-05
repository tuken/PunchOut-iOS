//
//  MainView.swift
//  Shared
//
//  Created by 井川 司 on 2022/03/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var main: MainViewModel
    
    @State var position =  CGPoint.zero
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                GeometryReader { g in
                    
                    HomeView()
                        .frame(width: g.size.width, height: g.size.height)
                        .disabled(self.main.showMenu ? true : false)
                    
                    ForEach(self.main.menus) { m in
                        NavigationLink(destination: m.type.destinationView, tag: m.type.tag, selection: self.$main.currentTag) {
                            EmptyView()
                        }
                    }
                }
                .background(Image("background"))
                .navigationBarTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.main.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                ))
                .navigationBarColor(Color(red: 1/255, green: 172/255, blue: 200/255))
                .gesture(TapGesture()
                    .onEnded { _ in
                        if self.main.showMenu {
                            withAnimation {
                                self.main.showMenu = false
                            }
                        }
                    })
                .gesture(DragGesture()
                    .onEnded {
                        if $0.translation.width > 120 {
                            withAnimation {
                                self.main.showMenu = true
                            }
                        }
                    })
            }
            
            if self.main.showMenu {
                
                GeometryReader { geometry in
                    
                    MenuView()
                        .environmentObject(self.main)
                        .frame(width: geometry.size.width*4/5, height: geometry.size.height)
                        .transition(.move(edge: .leading))
                        .gesture(DragGesture()
                            .onEnded {
                                if $0.translation.width < -100 {
                                    withAnimation {
                                        self.main.showMenu = false
                                    }
                                }
                            })
                }
            }
        }
    }
}

class MainViewModel: ObservableObject {
    
    @Published var showMenu = false
    
    @Published var destination: AnyView? = nil
    
    @Published var currentTag: String? = nil
    
    //    public let menus = [MenuItem(type: .setting), MenuItem(type: .logout)]
    public let menus = [MenuItem(type: .setting)]
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
    }
}
