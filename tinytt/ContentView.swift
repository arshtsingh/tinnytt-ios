//
//  ContentView.swift
//  tinytt
//
//  Created by limitless on 1/26/21.
//

import SwiftUI

struct HomeView: View {
    @State private var task: String = ""
    @State private var showDetails = false

    var body: some View {
        HStack{
            VStack(alignment: .center) {
                TextField(
                    "What are you doing right now?",
                    text: $task
                )
                
                Button(action: {
                    self.showDetails = true
                }) {
                    Text("Send")
                }
                
                if showDetails {
                    Text("Data sent!")
                    .font(.largeTitle)
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SplashView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack {
            if self.isActive {
                HomeView()
            } else {
                ContentView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("tinyTT")
                    .font(.system(size:45, weight: .light))
                Text("stochastic time tracking")
                    .foregroundColor(.accentColor)
            }
            Image(systemName: "clock")
                .font(.system(size: 50))
                .imageScale(.medium)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView()
        }
    }
}
