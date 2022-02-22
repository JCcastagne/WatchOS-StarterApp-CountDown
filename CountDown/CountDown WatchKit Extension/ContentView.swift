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
                .font(.title)
                .fontWeight(.semibold)
                .padding()
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
                    Image(systemName: "plus").font(.system(size: 22))
                }
                Button {
                    print("Decrement")
                    countDownTimer = countDownTimer - 1
                } label: {
                    Image(systemName: "minus").font(.system(size: 22))
                }
                
            }
            
            HStack(){
                Button {
                    print("Start CountDown")
                    timerRunning = true
                } label: {
                    Image(systemName: "play.fill").foregroundColor(Color.green)
                }
                Button {
                    print("Pause/Resume CountDown")
                    if(timerRunning == true){
                        timerRunning = false
                    } else {
                        timerRunning = true
                    }
                } label: {
                    Image(systemName: "pause.fill").foregroundColor(Color.blue)
                }
                Button {
                    print("Stop CountDown")
                    timerRunning = false
                    countDownTimer = 0
                } label: {
                    Image(systemName: "stop.fill").foregroundColor(Color.red)
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
