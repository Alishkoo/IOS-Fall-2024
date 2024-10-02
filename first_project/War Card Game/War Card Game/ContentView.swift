//
//  ContentView.swift
//  War Card Game
//
//  Created by Alibek Baisholanov on 30.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }.padding(20)
                Spacer()
                
                Button{
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                HStack{
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                            
                        
                        Text(playerScore.formatted())
                            .font(.largeTitle)
                        
                    }
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                            
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    
                    }
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal(){
        //Randomize cards player
        var num1 = Int.random(in: 2...14)
        playerCard = "card\(num1)"
        
        //Randomize cards cpu
        var num2 = Int.random(in: 2...14)
        cpuCard = "card\(num2)"
        
        //update scores
        if (num1 > num2){
            playerScore+=1
        }
        else if(num1 < num2){
            cpuScore+=1
        }
        
    }
}



#Preview {
    ContentView()
}
