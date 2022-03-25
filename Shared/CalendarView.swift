//
//  CalendarView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/22.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var cal = CalendarViewModel()
    
    var body: some View {
        
        VStack {
            Text("\(self.cal.currentDate)")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(.title2, design: .monospaced))
                .padding()
            
            Text("\(self.cal.currentDoW)")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(.subheadline, design: .monospaced))
                .padding()
            
            Text("\(self.cal.currentTime)")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(.largeTitle, design: .monospaced))
                .padding()
        }
        .onAppear(perform: {
            cal.start()
        })
        .onDisappear(perform: {
            cal.stop()
        })
    }
}

struct CalendarView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CalendarView()
    }
}

class CalendarViewModel: ObservableObject {
    
    var timer = Timer()
    
    let formatterDate = DateFormatter()
    
    let formatterDoW = DateFormatter()
    
    let formatterTime = DateFormatter()
    
    @Published var currentDate = ""
    
    @Published var currentDoW = ""
    
    @Published var currentTime = ""
    
    init() {
        
        self.formatterDate.dateStyle = .medium
        self.formatterDoW.dateFormat = "EEEE"
        self.formatterTime.dateFormat = "HH : mm : ss"
        
        let now = Date()
        self.currentDate = self.formatterDate.string(from: now)
        self.currentDoW = self.formatterDoW.string(from: now)
        self.currentTime = self.formatterTime.string(from: now)
    }
    
    func start() {
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            
            let now = Date()
            self.currentDate = self.formatterDate.string(from: now)
            self.currentDoW = self.formatterDoW.string(from: now)
            self.currentTime = self.formatterTime.string(from: now)
        })
    }
    
    func stop() {
        
        self.timer.invalidate()
    }
}
