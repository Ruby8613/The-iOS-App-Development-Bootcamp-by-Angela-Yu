//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    /*
    let quiz = [
        "Five + eight is equal to thirteen",
        "Five + eight is greater than ten",
        "thirteen - eight is less than three"
    ]
    */
    
    /*
    let quiz = [
        ["Five + eight is equal to thirteen", "True"],
        ["Five + eight is greater than ten", "True"],
        ["thirteen - eight is less than three", "False"]
    ]
     */
    /*
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        
//        Question(q: "Five + eight is equal to thirteen", a: "True"),
//        Question(q: "Five + eight is greater than ten", a: "True"),
//        Question(q: "thirteen - eight is less than three", a: "False")
    ]
    */
    
//    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        questionLabel.text = "Five + eight is equal to thirteen"
//        questionLabel.text = quiz[questionNumber]
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // true or false
//        let actualAnswer = quiz[questionNumber].answer
//        quizBrain.checkAnswer(userAnswer)
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
//        let actualQuestion = quiz[questionNumber]
//        let actualAnswer = actualQuestion.answer
        
        if userGotItRight {
//            print("Right!")
            sender.backgroundColor = UIColor.green
        } else {
//            print("Wrong! Try again")
            sender.backgroundColor = UIColor.red
        }
        
        /*
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        */
         
        /*
        if userAnswer == actualAnswer {
//            print("Right!")
            sender.backgroundColor = UIColor.green
        } else {
//            print("Wrong! Try again")
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        */
        
//        questionNumber += 1
//        updateUI()
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
//        questionLabel.text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // bar
//        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        progressBar.progress = quizBrain.getProgress()
    }
}

