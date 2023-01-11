//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Marquise Adeleye on 12/8/22.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var gameLogic = GameLogic()
    
    var body: some View{
        
        
        let borderSize = CGFloat(5)
        
        Text(gameLogic.turnText())
            .font(.title)
            .bold()
            .padding()
        Spacer()
        
        Text(String(format: "Player One %d", gameLogic.playerOneScore))
            .font(.title)
            .bold()
            .padding()
        
        VStack(spacing: borderSize){
            
            ForEach(0...2, id: \.self){
                row in
                HStack(spacing: borderSize){
                    
                    ForEach(0...2, id: \.self){
                        column in
                        
                        let square = gameLogic.board[row][column]
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: .infinity, height:.infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(square.squareColor())
                            .onTapGesture{
                                gameLogic.placeSquare(row, column)
                                
                                
                            }
                    }
                }
                .alert(isPresented: $gameLogic.drawAndWin){
                    Alert(title: Text(gameLogic.endMessage), dismissButton: .default(Text("Okay")){
                        gameLogic.resetBoard()
                    }
                    )
                }
                
               
            }
            
            Text(String(format: "Player Two %d", gameLogic.playerTwoScore))
                .font(.title)
                .bold()
                .padding()
            Spacer()
        }
        
        
        
        /*
         var body: some View {
         HStack{
         RoundedRectangle(cornerRadius: 5)
         .frame(width: 100, height: 100)
         .foregroundColor(color)
         }
         .onTapGesture {
         playerNumber.toggle()
         }
         }
         }
         
         */
        
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
}
