//
//  CalendarView.swift
//  PunchOut
//
//  Created by 井川司 on 2022/03/22.
//

import SwiftUI

struct CalendarView: View {
    
    @ObservedObject var cal = CalendarViewModel()

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
            print("👍 onAppear")
        })
        .onDisappear(perform: {
            cal.stop()
            print("👍 onDisappear")
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

    @Published var currentDate = "16 Mar, 2022"

    @Published var currentDoW = "Thursday"

    @Published var currentTime = "18 : 57 : 20"

    init() {
        
        self.formatterDate.dateStyle = .medium
        self.formatterDoW.dateFormat = "EEEE"
        self.formatterTime.timeStyle = .medium
    }

    func start() {
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in

            let now = Date()
            self.currentDate = self.formatterDate.string(from: now)
            self.currentDoW = self.formatterDoW.string(from: now)
            self.currentTime = self.formatterTime.string(from: now)
            print("👍 \(self.currentTime)")
       })
    }

    func stop() {
        
        self.timer.invalidate()
    }
}
