//
//  QuizViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/02.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    
    var csvArray = [String]()
    var quizArray = [String]()
    var quizCount = 0
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        csvArray = LoadCVS(fileName: "quiz1")
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonAciton(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            print("正解")
            correctCount += 1
        } else {
            print("不正解")
        }
    }
    
    func setNextQuiz() {
        quizCount  += 1
        
        csvArray = quizArray[quizCount].components(separatedBy: ",")
        
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
    }
    
    func LoadCVS(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "n")
            csvArray = lineChange.components(separatedBy: "/n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


