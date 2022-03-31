//
//  Menu.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/31.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    
    var id = UUID()
    
    var type: MenuType
    
    enum MenuType: String {
        
        case setting = "Settings"
        
        case favorite = "Favorite"
        
        case logout = "Logout"
        
        var title: String {
            
            self.rawValue
        }
        
        var imageName: String {
            
            switch self {
            case .setting: return "gear"
            case .favorite: return "star.circle"
            case .logout: return "arrow.turn.up.left"
            }
        }
        
        var tag: String {
            
            self.rawValue
        }
        
        var destinationView: AnyView {
            
            switch self {
            case .setting: return AnyView(SettingsView())
            case .favorite: return AnyView(EmptyView())
            case .logout: return AnyView(EmptyView())
            }
        }
    }
}
