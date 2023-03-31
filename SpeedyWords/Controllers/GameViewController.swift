//
//  GameViewController.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-30.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    private var countdown: CountdownTimer?
    let collection = WordCollection()
    let startTime : Double = 10
    var index : Int = -1
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        nextWord()
        timerLabel.text = "Time Left: \(Int(startTime))"
        self.countdown = CountdownTimer(interval: startTime, tickHandler: { remainingTime in
            DispatchQueue.main.async {
                self.timerLabel.text = "Time left: \(Int(remainingTime))"
            }
        }, completionHandler: {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "GameOver", message: "Tiden är över! Din totala poäng är: \(self.score)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    let next = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as! GameOverViewController
                    next.score = self.score
                    self.present(next, animated: true, completion: nil)
                }))
                self.present(alert, animated: true)
            }
        })
        
        countdown?.start()
    }
    
    func nextWord() {
        index += 1
        if index > collection.count - 1 {
            let alert = UIAlertController(title: "Du vann", message: "Grattis! Din totala poäng är: \(self.score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                let next = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as! GameOverViewController
                next.score = self.score
                self.present(next, animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        } else {
            wordLabel.text = collection.getCurrentWord(at: index)
            inputField.text = ""
            countdown?.reset()
        }
    }
    
    @IBAction func textFieldOnChanged(_ sender: Any) {
        if inputField.text?.lowercased() == collection.getCurrentWord(at: index) {
            score += 1
            scoreLabel.text = "Score: \(score)"
            nextWord()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
