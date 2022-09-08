//
//  ContentView.swift
//  Bullseye
//
//  Created by Ahmad Ayman Mansour on 02/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible : Bool = false
    @State private var slideValue :Double = 50.0
    @State private var game : Game = Game()
    var body: some View {
        VStack{
            Text("🎯🎯🎯\nPut  the Bullseye As Close As You Can !")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center).lineSpacing(4.0)
                
            

            Text(String(game.target))
                .kerning(-1)
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Text("1").bold()
                Slider(value: self.$slideValue , in: 1.0 ... 100.0)
                Text("100").bold()
            }
            Button(action:{
                self.alertIsVisible=true
            }) {
            Text("Hit Me ! ")
            }.alert(isPresented: $alertIsVisible, content: {
                let roundedValue : Int = Int(self.slideValue.rounded())
                return Alert(title: Text(" Hellow there!"), message: Text("The Hitting Value is \(roundedValue)"), dismissButton:.default(Text("Awesom !"))) })
        }
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
