//
//  color_pick_logic.swift
//  tic-tac-toe
//
//  Created by Marquise Adeleye on 1/9/23.
//


import Foundation

class ColorPickLogic: ObservableObject{
    
    @Published var pick = [[makingButtons]]()
    
//intializng the rest of the players color pick
    
    init(){
        resetPick()
    }
    
    func resetPick() {
        var newPick = [[makingButtons]]()
        
        for _ in 0...2{
            var row = [makingButtons]()
            for _ in 0...2{
                row.append(makingButtons(square: Square.Empty))
            }
            newPick.append(row)
        }
        pick = newPick
    }
}


