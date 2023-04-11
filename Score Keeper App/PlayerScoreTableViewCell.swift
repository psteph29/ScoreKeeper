//
//  PlayerScoreTableViewCell.swift
//  Score Keeper App
//
//  Created by Paige Stephenson on 3/30/23.
//

import UIKit

protocol PlayerScoreTableViewCellDelegate: AnyObject {
    func scoreDidChange(newScore: Int, sender: PlayerScoreTableViewCell)
}

class PlayerScoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreCounter: UIStepper!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
   
    weak var delegate: PlayerScoreTableViewCellDelegate?
    
    func update(with player: Player) {
        nameLabel.text = player.playerName
        scoreCounter.value = Double(player.playerScore)
        totalScoreLabel.text = String(player.playerScore)
    }
    
    func updateScore() {
        totalScoreLabel.text = "\(Int(scoreCounter.value))"
    }
    
    
    @IBAction func stepperScoreTrackerChanged(_ sender: UIStepper) {
        updateScore()
        delegate?.scoreDidChange(newScore: Int(sender.value), sender: self)
       

    }
    
}
