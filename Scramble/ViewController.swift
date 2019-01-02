//
//  ViewController.swift
//  Scramble
//
//  Created by Audrey Ladd on 1/1/19.
//  Copyright © 2019 Audrey Ladd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var waffleImage: UIImageView!
    @IBOutlet weak var waffleText: UITextView!
    @IBOutlet weak var eatButton: UIButton!
    
    @IBOutlet weak var slowFoodButton: UIButton!
    @IBOutlet weak var normalFoodButton: UIButton!
    @IBOutlet weak var fastFoodButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    @IBOutlet weak var livesTextLabel: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var gameOverScoreTextLabel: UILabel!
    @IBOutlet weak var gameOverScoreLabel: UILabel!
    @IBOutlet weak var eatAgainButton: UIButton!
    
    var slowTimer = Timer()
    var normalTimer = Timer()
    var fastTimer = Timer()
    let food = [#imageLiteral(resourceName: "Waffle"), #imageLiteral(resourceName: "Croissant"), #imageLiteral(resourceName: "Egg")]
    
    var score = 0
    var lives = 3 {
        willSet {
            if newValue == 0 {
                slowTimer.invalidate()
                normalTimer.invalidate()
                fastTimer.invalidate()
                
                slowFoodButton.isHidden = true
                normalFoodButton.isHidden = true
                fastFoodButton.isHidden = true
                scoreLabel.isHidden = true
                scoreTextLabel.isHidden = true
                livesLabel.isHidden = true
                livesTextLabel.isHidden = true
                
                gameOverScoreLabel.text = String(score)
                gameOverLabel.isHidden = false
                gameOverScoreTextLabel.isHidden = false
                gameOverScoreLabel.isHidden = false
                eatAgainButton.isHidden = false
            }
        }
    }
    
    func startNewGame() {
        score = 0
        lives = 3
        
        waffleImage.isHidden = true
        waffleText.isHidden = true
        eatButton.isHidden = true
        
        slowFoodButton.isHidden = true
        normalFoodButton.isHidden = true
        fastFoodButton.isHidden = true
        
        scoreLabel.isHidden = false
        scoreTextLabel.isHidden = false
        livesLabel.isHidden = false
        livesTextLabel.isHidden = false
        
        gameOverLabel.isHidden = true
        gameOverScoreTextLabel.isHidden = true
        gameOverScoreLabel.isHidden = true
        eatAgainButton.isHidden = true
        
        runSlowTimer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.runNormalTimer()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.runFastTimer()
        }
        
        scoreLabel.text = String(score)
        livesLabel.text = String(lives)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slowFoodButton.isHidden = true
        normalFoodButton.isHidden = true
        fastFoodButton.isHidden = true
        
        scoreLabel.isHidden = true
        scoreTextLabel.isHidden = true
        livesLabel.isHidden = true
        livesTextLabel.isHidden = true
        
        gameOverLabel.isHidden = true
        gameOverScoreTextLabel.isHidden = true
        gameOverScoreLabel.isHidden = true
        eatAgainButton.isHidden = true
    }
    
    @IBAction func eat() {
        startNewGame()
    }
    
    func runSlowTimer() {
        slowTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(ViewController.updateSlowFoodPosition)), userInfo: nil, repeats: true)
    }
    
    func runNormalTimer() {
        normalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateNormalFoodPosition)), userInfo: nil, repeats: true)
    }
    
    func runFastTimer() {
        fastTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: (#selector(ViewController.updateFastFoodPosition)), userInfo: nil, repeats: true)
    }
    
    @objc func updateSlowFoodPosition() {
        slowFoodButton.isHidden = false
        slowFoodButton.center.x = CGFloat.random(in: 100...view.bounds.width - 100)
        slowFoodButton.center.y = CGFloat.random(in: 150...view.bounds.height - 100)
        slowFoodButton.setImage(food.randomElement(), for: .normal)
    }
    
    @objc func updateNormalFoodPosition() {
        normalFoodButton.isHidden = false
        normalFoodButton.center.x = CGFloat.random(in: 100...view.bounds.width - 100)
        normalFoodButton.center.y = CGFloat.random(in: 150...view.bounds.height - 100)
        normalFoodButton.setImage(food.randomElement(), for: .normal)
    }
    
    @objc func updateFastFoodPosition() {
        fastFoodButton.isHidden = false
        fastFoodButton.center.x = CGFloat.random(in: 100...view.bounds.width - 100)
        fastFoodButton.center.y = CGFloat.random(in: 150...view.bounds.height - 100)
        fastFoodButton.setImage(food.randomElement(), for: .normal)
    }
    
    @IBAction func slowFoodTapped() {
        slowFoodButton.isHidden = true
        if slowFoodButton.image(for: .normal) == #imageLiteral(resourceName: "Waffle") {
            score += 1
        } else {
            lives -= 1
        }
        updateLabels()
    }
    
    @IBAction func normalFoodTapped() {
        normalFoodButton.isHidden = true
        if normalFoodButton.image(for: .normal) == #imageLiteral(resourceName: "Waffle") {
            score += 1
        } else {
            lives -= 1
        }
        updateLabels()
    }
    
    @IBAction func fastFoodTapped() {
        fastFoodButton.isHidden = true
        if fastFoodButton.image(for: .normal) == #imageLiteral(resourceName: "Waffle") {
            score += 1
        } else {
            lives -= 1
        }
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        livesLabel.text = String(lives)
    }
    
    @IBAction func eatAgain() {
        startNewGame()
    }

}

