//
//  FieldViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/06.
//

import UIKit

class FieldViewController: UIViewController {
    
    @IBOutlet weak var selectFiledButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectFiledButton.setTitle("仮", for: .normal)
        selectFiledButton.layer.cornerRadius = 25
    }
}
