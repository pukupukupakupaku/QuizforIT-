//
//  PrepareQuizViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/04.
//

import UIKit
import SwiftyJSON

// データモデル
struct Quiz: Codable {
    let question: String
    let explanation: String
    let answer: Int
    let options: [String]
}

class PrepareQuizViewController: UIViewController {
    
    var jsonData: JSON! {
        didSet {
//            print(jsonData)
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //データを送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? QuizViewController else { return }
        guard let data = jsonData.dictionary?.values.first?.array else {return}
        vc.delegate = self
        vc.data = data
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

extension PrepareQuizViewController: QuizViewControllerDelegate {
    func didDismiss(_ viewController: QuizViewController) {
        
            self.navigationController?.popToRootViewController(animated: false)
        
    }
    
    
}
