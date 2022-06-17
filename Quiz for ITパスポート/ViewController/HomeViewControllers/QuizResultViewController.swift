//
//  QuizResultViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/03.
//

import UIKit

protocol QuizResultViewControllerDelegate: AnyObject {
    func topButtonDidTap(_ viewController: QuizResultViewController)
}

class QuizResultViewController: UIViewController {

    weak var delegate: QuizResultViewControllerDelegate?
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    var correctData = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        correctPercentLabel.text = "\(Int(round((Double(correctData) / Double(total)) * 100)))%"
        
    }
    
    @IBAction func didTapTopButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true)
    }
    
    @IBAction func onTopDidTap(_ sender: Any) {
        delegate?.topButtonDidTap(self)
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
