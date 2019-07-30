//
//  ViewController.swift
//  Color Guessing Game
//
//  Created by Jason Ruan on 7/30/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = Counter()
    var redValue: CGFloat = 0.0
    var greenValue: CGFloat = 0.0
    var blueValue: CGFloat = 0.0
    var playerChoice = ""
    var correctAnswer = ""
    
    @IBOutlet weak var changeColor: UIButton!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var highestScore: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var gameOverMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverMessage.text = "Start Game?"
        disableAllButtons()
    }
    
    @IBAction func changeTheColor(_ sender: UIButton) {
        enableAllButtons()
        changeTheColor()
        counter.count = 0
        gameOverMessage.text = ""
        highestScore.text = "Highest Score: \(Counter.highestScoreRecorded)"
        currentScore.text = "Current Score: \(counter.count)"
        changeColor.isEnabled = false
    }
    
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        playerChoice = "Red"
        findAnswer()
        checkAnswer()
        changeTheColor()
    }
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        playerChoice = "Green"
        findAnswer()
        checkAnswer()
        changeTheColor()
    }
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        playerChoice = "Blue"
        findAnswer()
        checkAnswer()
        changeTheColor()
    }
    
    func changeTheColor() {
        redValue = CGFloat.random(in: 0...1)
        greenValue = CGFloat.random(in: 0...1)
        blueValue = CGFloat.random(in: 0...1)
        self.color.backgroundColor = UIColor.init(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: CGFloat.random(in: 0...1))
    }
    
    func findAnswer() {
        if redValue >= greenValue && redValue >= blueValue {
            correctAnswer = "Red"
        } else if greenValue >= redValue && greenValue >= blueValue {
            correctAnswer = "Green"
        } else {
            correctAnswer = "Blue"
        }
    }
    
    func checkAnswer() {
        if playerChoice == correctAnswer {
            counter.increaseScore()
            currentScore.text = "Current Score: \(counter.count)"
        } else {
            gameOverMessage.text = "Game Over!"
            currentScore.text = "Current Score: \(counter.count)"
            changeColor.isEnabled = true
            if counter.count > Counter.highestScoreRecorded {
                Counter.highestScoreRecorded = counter.count
            }
            disableAllButtons()
        }
    }
    
    func enableAllButtons() {
        redButton.isEnabled = true
        greenButton.isEnabled = true
        blueButton.isEnabled = true
    }
    
    func disableAllButtons() {
        redButton.isEnabled = false
        greenButton.isEnabled = false
        blueButton.isEnabled = false
    }
}

