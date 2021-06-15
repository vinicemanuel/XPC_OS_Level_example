//
//  ContentView.swift
//  XPC_Services_App
//
//  Created by Vinicius Emanuel on 06/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var typedText = ""
    @State var lastProcessedMessage = "Hello, World!"
    @State var color: NSColor = .blue
    
    let width: CGFloat = 650
    let height: CGFloat = 400
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(lastProcessedMessage)
            
            Spacer()
                .frame(height: 30)
            
            HStack {
                Spacer()
                TextField("TextInput:", text: $typedText)
                    .frame(width: 300)
                Spacer()
                Button("run") {
                    
                    StringUtility().upercase(self.typedText) { (value) in
                        self.lastProcessedMessage = value
                    }
                }
                Spacer()
            }
            Spacer()
            
            HStack(spacing: 8) {
                BaseView(viewID: "view_1")
                    .padding(.leading, 8)
                BaseView(viewID: "view_2")
                BaseView(viewID: "view_3")
                BaseView(viewID: "view_4")
                    .padding(.trailing, 8)
            }
            .frame(width: self.width, height: self.height/2)
        }
        .frame(width: self.width, height: self.height)
        .background(Color(.orange))
        .animation(.default)
    }
}

struct BaseView: View {
    let viewID: String
    @State var color: NSColor = .blue
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("Start randon color") {
                    ColorUtility().randonColor(id: self.viewID) { (newColor) in
                        self.color = NSColor(red: CGFloat(newColor.red), green: CGFloat(newColor.green), blue: CGFloat(newColor.blue), alpha: 1)
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .onAppear(perform: {
            NotificationCenterHelper.shared.startObserve(id: self.viewID, replay: { (newColor) in
                self.color = NSColor(red: CGFloat(newColor.red), green: CGFloat(newColor.green), blue: CGFloat(newColor.blue), alpha: 1)
            })
        })
        .background(Color(self.color))
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
