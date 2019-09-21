//
//  Sign.swift
//  RPS
//
//  Created by Sahil Singh Rawat on 21/09/19.
//  Copyright © 2019 Sahil Singh Rawat. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSighn()->Sign{
    let opponentSign = randomChoice.nextInt()
    if opponentSign==0 {
        return .Rock
    }else if opponentSign==1{
        return .Paper
    }else{
        return .Scissors
    }
}
enum Sign{
    case Rock,Paper,Scissors
    var emoji : String{
    
        switch self{
        case .Rock:
            return "👊🏻"
        case .Paper:
            return "🖐🏻"
        case .Scissors:
            return "✌🏻"
        }

    }

func takeTurn(_ opponentSign:Sign)-> State{
   
    switch self {
    case .Rock:
        switch opponentSign{
        case .Paper:
            return .lose
        case .Scissors:
            return .win
        case .Rock:
            return .draw
        }
    case .Paper:
        switch opponentSign{
        case .Paper:
            return .draw
        case .Scissors:
            return .lose
        case .Rock:
            return .win
        }
    case .Scissors:
        switch opponentSign{
        case .Paper:
            return .win
        case .Scissors:
            return .draw
        case .Rock:
            return .lose
        }
    }
    }
}
