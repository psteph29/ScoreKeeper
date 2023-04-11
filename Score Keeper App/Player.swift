//
//  Player.swift
//  Score Keeper App
//
//  Created by Paige Stephenson on 4/8/23.
//

import Foundation

struct Player {
    

    var playerName: String
    var playerScore: Int
    
   
    static func loadPlayers() -> [Player]? {
        return nil
    }
    
    static func loadComputedPlayers() -> [Player] {
        let player1 = Player(playerName: "One", playerScore: 0)
        let player2 = Player(playerName: "Two", playerScore: 0)
        let player3 = Player(playerName: "Three", playerScore: 0)
        
        return [player1, player2, player3]
    }


    
}
