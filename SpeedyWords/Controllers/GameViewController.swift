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
            print("Countdown complete!")
        })
        
        countdown?.start()
    }
    
    func nextWord() {
        index += 1
        wordLabel.text = collection.getCurrentWord(at: index)
        inputField.text = ""
        countdown?.reset()
    }
    
    @IBAction func textFieldOnChanged(_ sender: Any) {
        if inputField.text == collection.getCurrentWord(at: index) {
            nextWord()
            score += 1
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
