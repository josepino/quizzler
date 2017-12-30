//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextQuestion()
        //let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
        
    }

    
    // Cuando el usuario presiona un boton. Se diferencia por Tags, True = 1, False = 2
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()       // Chequeamos la respuesta
        questionNumber += 1     // Incrementamos en uno para la siguiente pregunta
        nextQuestion()
        
    }
    
    
    
    func updateUI() {
        scoreLabel.text = "Puntos: \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText     // Mostramos la siguiente pregunta
            updateUI()
            
        } else {
           let alert = UIAlertController(title: "Fin", message: "Se acabaron las preguntas, ¿Comenzar de nuevo?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Reiniciar", style: .default, handler: { (UIAlertAction) in self.startOver()
                })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    func checkAnswer() {
        let corrrectAnswer = allQuestions.list[questionNumber].answer
        if corrrectAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correcto")
            score = score + 1
            
        } else {
            ProgressHUD.showError("Incorrecto")
        }
    }
    
    
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
