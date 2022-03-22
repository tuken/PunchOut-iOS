//
//  CalendarView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/22.
//

import SwiftUI

struct CalendarView: View {
    
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
        self.formatterTime.timeStyle = .medium

        start()
    }

    func start() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in

            let now = Date()
            self.currentDate = self.formatterDate.string(from: now)
            self.currentDoW = self.formatterDoW.string(from: now)
            self.currentTime = self.formatterTime.string(from: now)
        })
    }

    func stop() {
        
        timer.invalidate()
    }

    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalendarView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CalendarView()
    }
}
