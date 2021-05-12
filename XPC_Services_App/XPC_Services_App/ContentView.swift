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
            
            Button("Start randon color") {
                ColorUtility().randonColor { (newColor) in
                    self.color = NSColor(red: CGFloat(newColor.red), green: CGFloat(newColor.green), blue: CGFloat(newColor.blue), alpha: 1)
                }
            }
            
            Spacer()
        }
        .background(Color(self.color))
        .animation(.default)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
