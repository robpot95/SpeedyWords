//
//  ViewController.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func playButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController")
        self.present(gameViewController, animated: true, completion: nil)
    }
}

