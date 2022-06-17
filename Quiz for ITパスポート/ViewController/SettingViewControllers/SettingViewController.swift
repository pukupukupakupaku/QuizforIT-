//
//  SettingViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/08.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sectionTitle = ["設定","このアプリについて"]
    
    let sampleData : [[String]] = [
        ["プレミアムプラン","成績の初期化","修得数データの初期化","通知"],
        ["評価","ご意見・ご要望","シェア","利用規約","プライバシー","バージョン"]
    ]
    var csvArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomSettingView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomSettingView")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = sampleData[indexPath.section][indexPath.row]
        if indexPath.section == 0 && indexPath.row == 3 {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else if indexPath.section == 1 && indexPath.row == 5 {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(indexPath.section): \(indexPath.row)")
        performSegue(withIdentifier: "toDetailVC", sender: nil)
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
