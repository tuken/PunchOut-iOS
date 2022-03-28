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
                
                GeometryReader { geometry in
                    
                    HomeView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .disabled(self.main.showMenu ? true : false)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                    .onChanged { val in
                                        if self.main.showMenu {
                                            self.position = val.location
                                        }
                                    }
                                    .onEnded {_ in
                                        if self.main.showMenu {
                                            if self.position.x > geometry.size.width*4/5 {
                                                withAnimation {
                                                    self.main.showMenu.toggle()
                                                }
                                            }
                                        }
                                    })
                }
                .navigationBarTitle("", displayMode: .inline)
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
                .background(Color(red: 1/255, green: 172/255, blue: 200/255))
                .navigationBarColor(Color(red: 1/255, green: 172/255, blue: 200/255))
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
                                                self.main.showMenu.toggle()
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
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
    }
}
