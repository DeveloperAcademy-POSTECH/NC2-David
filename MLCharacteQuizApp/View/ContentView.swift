//
//  ContentView.swift
//  MLCharacteQuizApp
//
//  Created by David_ADA on 2022/08/27.
//

import SwiftUI

struct ContentView: View {
    @State var currentDate = Date()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 10
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack {
            Text("\(currentDate)")
                        .onReceive(timer) { input in
                            currentDate = input
                        }
            Text("\(timeRemaining)")
                        .onReceive(timer2) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                                if timeRemaining == 0 {
                                    timeRemaining = 10
                                }
                            }
                        }
            Text("Hello, world!")
                .padding()
            Button("퀴즈시작하기") {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
