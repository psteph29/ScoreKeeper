//
//  ScoreKeepingTableViewController.swift
//  Score Keeper App
//
//  Created by Paige Stephenson on 3/30/23.
//

import UIKit

class ScoreKeepingTableViewController: UITableViewController, PlayerScoreTableViewCellDelegate {
    func scoreDidChange(newScore: Int, sender: PlayerScoreTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            players[indexPath.row].playerScore = newScore
            players.sort { $0.playerScore > $1.playerScore }
            tableView.reloadData()
        }
    }
    
    
    
    var players = [Player]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentPlayer = Player.loadPlayers() {
            players = currentPlayer
        } else {
            players = Player.loadComputedPlayers()
        }

        navigationItem.leftBarButtonItem = editButtonItem
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerProfile", for: indexPath) as! PlayerScoreTableViewCell
        let playerProfile = players[indexPath.row]
        cell.update(with: playerProfile)
        cell.delegate = self
        cell.updateScore()
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    @IBAction func unwindToScoreKeeperPage(segue: UIStoryboardSegue) {
        guard segue.identifier == "SavePlayerButton" else { return }
        let sourceViewController = segue.source as! AddPlayerViewController
        
        if let player = sourceViewController.player {
            let newIndexPath = IndexPath(row: players.count, section: 0)
            
            players.append(player)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

}

