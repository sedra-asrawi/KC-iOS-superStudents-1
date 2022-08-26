//
//  ContentView.swift
//  Super1
//
//  Created by Sedra Asrawi on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var image1 = "rock"
    @State var image2 = "rock"
    @State var game = ["rock","paper","scissors"]
    @State var play1 = 0
    @State var play2 = 0
    @State var showAlert1 = false
    @State var showAlert2 = false

    @State var title = ""

    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
            Text("Player 1")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)

                HStack {
                    Text("Points :")
                            .font(.system(size: 20))
                        .fontWeight(.light)
                    
                    Text("\(play1)")
                            .font(.system(size: 20))
                        .fontWeight(.light)
                }
                .alert(isPresented: $showAlert1) {
                    Alert(title: Text("We Have A Winner 😍"),
                          message: Text("Player1 has won !"),
                          dismissButton: .cancel()) }

                
                Image(image1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                
                Image(image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                Text("Player 2")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                HStack {
                    Text("Points :")
                        .fontWeight(.light)
                    Text("\(play2)")
                            .font(.system(size: 20))
                        .fontWeight(.light)
                }
                .alert(isPresented: $showAlert2) {
                    Alert(title: Text("We Have A Winner 😍"),
                          message: Text("Player2 has won !"),
                          dismissButton: .cancel()) }
                
                Spacer()
                
                
                Button {
                    
                    image1 = game.randomElement() ?? "rock"
                    image2 = game.randomElement() ?? "rock"

                    if image1 == "rock" && image2 == "scissors"
                    ||
                        image1 == "paper" && image2 == "rock"
                        ||
                        image1 == "scissors" && image2 == "paper"
                        
                        { play1 += 1 }
                    
                    else if image1 == image2 {
                        play1 += 0
                    }
                    
                    else {
                        play2 += 1
                    }
                    
                    if play1 == 3 {
                        showAlert1 = true
                    }
                    
                    if play2 == 3 {
                        showAlert2 = true
                    }
                    
                }
                
               
            
            label: {
                    Text("Go !")
                        .font(.system(size: 35))
                        .foregroundColor(.yellow)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 200)
                        .background(.blue)
                        .cornerRadius(20)
                        .shadow(color: .blue, radius: 10)
                }
                
//            .alert(isPresented: $showAlert1) {
//                Alert(title: Text("We Have A Winner 😍"),
//                      message: Text("Player1 has won !"),
//                      dismissButton: .cancel()) }
                
//            .alert(isPresented: $showAlert2) {
//                Alert(title: Text("We Have A Winner 😍"),
//                      message: Text("Player2 has won !"),
//                      dismissButton: .cancel()) }

                
                    
                    
                
                
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
