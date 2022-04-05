//
//  SplashView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/04/05.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isSplashing: Bool

    @State private var scale = 1.0
    
    var body: some View {
        
        ZStack {
            
            Color(red: 1/255, green: 172/255, blue: 200/255)
                .ignoresSafeArea()
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .scaleEffect(scale)
                .animation(.linear(duration: 4), value: scale)
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        scale = 2.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        scale = 3.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        scale = 4.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        isSplashing = false
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SplashView(isSplashing: .constant(true))
    }
}
