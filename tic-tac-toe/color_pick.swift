//
//  color_pick.swift
//  tic-tac-toe
//
//  Created by Marquise Adeleye on 12/20/22.
//

import SwiftUI

struct colorPick: View {
    
    @StateObject var colorPick = ColorPickLogic()
    
    var body: some View {
        
        let borderSize = CGFloat(5)
        
        VStack(spacing: borderSize){
            
            ForEach(0...2, id: \.self){
                row in
                HStack(spacing: borderSize){
                    
                    ForEach(0...2, id: \.self){
                        column in
                        
                        let square = colorPick.pick[row][column]
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: .infinity, height:.infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .foregroundColor(Color("blue"))
                        
                            
                    }
                }
                }
            }
        .padding()
            Spacer()
        }
    }

        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                colorPick()
            }
        }
        


