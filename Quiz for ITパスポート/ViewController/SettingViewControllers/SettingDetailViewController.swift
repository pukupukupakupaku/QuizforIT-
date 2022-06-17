//
//  SettingDetailViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/10.
//

import UIKit

class SettingDetailViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setupViewController() {
        
        let firstViewController = storyboard?.instantiateViewController(withIdentifier: "settingDataViewController") as! SettingDataViewController
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
