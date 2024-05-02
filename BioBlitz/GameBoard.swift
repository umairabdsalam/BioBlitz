//
//  GameBoard.swift
//  BioBlitz
//
//  Created by Umair Salam on 4/30/24.
//

import SwiftUI

class GameBoard: ObservableObject {
    
    let rowCount = 11
    let columnCount = 22
    
    @Published var grid = [[Bacteria]]()
    
    init() {
        reset()
        
    }
    
    func reset(){
        grid.removeAll()
        
        for row in 0..<rowCount {
            var newRow = [Bacteria]()
            
            for col in 0..<columnCount {
                let bacteria = Bacteria(row: row, col: col)
                
                if row <= rowCount / 2 {
                    if row == 0 && col == 0 {
                        //make sure the player starts pointing away from anything
                        bacteria.direction = .north
                    } else if row == 0 && col == 1 {
                        // make sure nothing points to the player
                        bacteria.direction = .east
                    } else if row == 1 && col == 0 {
                        // make sure nothing points to the player
                        bacteria.direction = .south
                    } else {
                        // all other pieces are random
                        bacteria.direction = Bacteria.Direction.allCases.randomElement()!
                    }
                } else {
                    // mirror the counterpart 
                }
                
                newRow.append(bacteria)
            }
            grid.append(newRow)
        }
        grid[0][0].color = .green
        grid[rowCount - 1][columnCount - 1].color = .red
    }
}
