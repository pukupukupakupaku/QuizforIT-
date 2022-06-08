//
//  TestHomeViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/08.
//

import UIKit

class TestHomeViewController: UIViewController {
    
    @IBOutlet weak var testButton1: SelectLevelCustomButton!
    @IBOutlet weak var testButton2: SelectLevelCustomButton!
    @IBOutlet weak var testButton3: SelectLevelCustomButton!
    @IBOutlet weak var explanationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testButton1.setTitle("基本", for: .normal)
        testButton2.setTitle("応用", for: .normal)
        testButton3.setTitle("発展", for: .normal)
        explanationTextView.text = "これはテストモードです\n全範囲からランダムで50問出題されます。"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func testButtonAction(sender: UIButton) {
        print(sender.tag)
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
