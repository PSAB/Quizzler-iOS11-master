//
//  ViewController.swift
//  Quizzler
//
//

import UIKit

class ViewController: UIViewController {
    //Place your instance variables here
    
    let allQuestions = QuestionBank() //Don't forget parenthesis when init() has no parameters!
    //Merely represents the answer of the button that the user pressed
    var pickedAnswer: Bool = false
    //represents the current question being asked. REPRESENTS THE STATE
    var questionNumber : Int = 0
    //represents the visible score of the user
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // present the first question
//        let firstQuestion = allQuestions.list[questionNumber] // This used to be zero
//        questionLabel.text = firstQuestion.questionText
        nextQuestion()
        
    }

    // When either true or false button is pressed
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        // You can also use print statements in the console to debug
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        
        progressBar.frame.size.width = (CGFloat(questionNumber + 1)) * (self.view.frame.size.width / CGFloat(allQuestions.list.count))
        
    }
    

    func nextQuestion() {
        // Update the UILabel to display the current question
        if questionNumber < 13 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            // update the score UI
            
            //update the progress Label
            updateUI()

        }
        else {
//            print("end of quiz")
//            // Land back at the first question if end is reached
//            questionNumber = 0
            let alert = UIAlertController(title: "Congrats!", message: "You reached the end of the quiz, would you like to start over?", preferredStyle: .alert)
            // the handler represents what happens when the button is pressed
            // when you see "in", make sure you use "self"
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            // add the newly-created action to the alert UIAlertController
            alert.addAction(restartAction)
            // present the alert to the user
            // "completion" is what to do after UIAlertController is presented. nil for this case.
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if pickedAnswer == correctAnswer {
            print("You got the correct answer!")
            // increment the score of the user
            score += 1
            updateUI()
        }
        else {
            print("Wrong, in Trump's voice")
        }
    }
    
    
    func startOver() {
        print("Starting over...")
        score = 0
        questionNumber = 0
        nextQuestion()
        
    }
    

    
}
