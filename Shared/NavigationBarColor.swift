//
//  NavigationBarColor.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/28.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {
    
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
        
        modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}
