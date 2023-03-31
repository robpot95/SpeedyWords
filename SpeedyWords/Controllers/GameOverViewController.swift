//
//  GameOverViewController.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-31.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var score = 0
    @IBOutlet weak var totalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalScore.text = "Total poäng: \(score)"
    }
    
    @IBAction func playAgain(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func Tillbaka(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(viewController, animated: true, completion: nil)
    }
}





