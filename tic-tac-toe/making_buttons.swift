//
//  tic_tac_toe_logic.swift
//  tic-tac-toe
//
//  Created by Marquise Adeleye on 12/8/22.
//

import Foundation
import SwiftUI


//Crating the Square type
enum Square {
    case PlayerOne, PlayerTwo, Empty
    
    func squareColor() -> Color {
        
        return Color("blue")
        
        /*  var squareColor() -> Color{
         switch(self){
         case Square.PlayerOne:
         return Color("firmPink")
         case Square.PlayerTwo:
         return Color("firmBlue")
         default:
         return Color("base")
         }
         */
    }
}
//Establishing the logic behind each button
struct makingButtons{
    
    var square: Square
    
    //What changes will occur when a square is tapped
    func squareColor() -> Color {
        
        //return Color("firmBlue")
        
       switch(square){
        case Square.PlayerOne:
            return Color("pink")
        case Square.PlayerTwo:
            return Color("blue")
        default:
            return Color("base")
        
        }
        
    }
}

