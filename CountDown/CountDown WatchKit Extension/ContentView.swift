//
//  ContentView.swift
//  CountDown WatchKit Extension
//
//  Created by JC Castagne on 2022-02-22.
//

import SwiftUI

struct ContentView: View {
    
    @State var countDownTimer = 0
    @State var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(){
            Text("\(countDownTimer)")
                .onReceive(timer) { _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }
            
            HStack(){
                Button {
                    print("Increment")
                    countDownTimer = countDownTimer + 1
                } label: {
                    Image(systemName: "plus")
                }
                Button {
                    print("Decrement")
                    countDownTimer = countDownTimer - 1
                } label: {
                    Image(systemName: "minus")
                }
                Button {
                    print("Start CountDown")
                    timerRunning = true
                } label: {
                    Text("Start")
                }
                Button {
                    print("Stop CountDown")
                    timerRunning = false
                    countDownTimer = 0
                } label: {
                    Text("Stop")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
