//
//  AddPlayerViewController.swift
//  Score Keeper App
//
//  Created by Paige Stephenson on 3/31/23.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    var player: Player?
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var currentScoreTextField: UITextField!
    @IBOutlet weak var savePlayerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentScoreTextField.text = "0"
        updateSaveButtonState()

    }
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = playerNameTextField.text?.isEmpty == false
        savePlayerButton.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func returnButtonPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "SavePlayerButton" else {
            return }
        
        let playerName = playerNameTextField.text!
        let playerScore = currentScoreTextField.text!
        player = Player(playerName: playerName, playerScore: Int(playerScore) ?? 0)

        
        
    }
    


}
