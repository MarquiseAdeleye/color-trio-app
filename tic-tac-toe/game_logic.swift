//
//  game_logic.swift
//  tic-tac-toe
//
//  Created by Marquise Adeleye on 12/15/22.
//

import Foundation


class GameLogic: ObservableObject{
    @Published var board = [[makingButtons]]()
    @Published var turn = Square.PlayerOne
    @Published var playerOneScore = 0
    @Published var playerTwoScore = 0
    @Published var drawAndWin = false
    @Published var endMessage = "Draw"
    
    init(){
        resetBoard()
    }
    func placeSquare(_ row: Int, _ column: Int){
        
        if (board[row][column].square != Square.Empty){
            
            return
        }
        //The code that toggles between play one a player two colors
        board[row][column].square = turn == Square.PlayerOne ? Square.PlayerOne : Square.PlayerTwo
        
        
        if(checkWin()){
            
            if(turn == Square.PlayerOne){
                playerOneScore += 1
            }
            else{
                playerTwoScore += 1
            }
            let winner = turn == Square.PlayerOne ? "Player One" : "Player Two"
            endMessage = winner + " Wins!"
            drawAndWin = true
            
        }
        else{
            turn = turn == Square.PlayerOne ? Square.PlayerTwo : Square.PlayerOne
        }
        if(checkDraw()){
            endMessage = "Draw!"
            drawAndWin = true
            
        }
    }
    
    
    func checkDraw() -> Bool{
        
        for row in board{
            for cell in row{
                if cell.square == Square.Empty{
                    return false
                }
            }
        }
        return true
    }
    func checkWin() -> Bool{
        
        //Checking for vertical placement wins
        if isTurnSquare(0, 0) && isTurnSquare(1, 0) && isTurnSquare(2, 0){
            return true
        }
        if isTurnSquare(0, 1) && isTurnSquare(1, 1) && isTurnSquare(2, 1){
            return true
        }
        if isTurnSquare(0, 2) && isTurnSquare(1, 2) && isTurnSquare(2, 2){
            return true
        }
        
        
        //Checking for horizontal placement wins
        if isTurnSquare(0, 0) && isTurnSquare(0, 1) && isTurnSquare(0, 2){
            return true
        }
        if isTurnSquare(1, 0) && isTurnSquare(1, 1) && isTurnSquare(1, 2){
            return true
        }
        if isTurnSquare(2, 0) && isTurnSquare(2, 1) && isTurnSquare(2, 2){
            return true
        }
        
        
        //Checking for diagonal placement wins
        if isTurnSquare(0, 0) && isTurnSquare(1, 1) && isTurnSquare(2, 2){
            return true
        }
        if isTurnSquare(0, 2) && isTurnSquare(1, 1) && isTurnSquare(2, 0){
            return true
        }
        return false
        
    }
    
    func turnText() ->String {
        
        return turn == Square.PlayerOne ? "Player One" : "Player Two"
        
    }
    
    func isTurnSquare(_ row: Int, _ column: Int) -> Bool{
        return board[row][column].square == turn
    }
    
    
    func resetBoard(){
        var newBoard = [[makingButtons]]()
        
        for _ in 0...2{
            var row = [makingButtons]()
            for _ in 0...2{
                row.append(makingButtons(square: Square.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
