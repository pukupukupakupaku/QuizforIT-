//
//  HomeViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/01.
//

import UIKit

class HomeViewController: UIViewController {
    
    // オブジェクト
    @IBOutlet weak var inspirationImageView: UIImageView!
    @IBOutlet weak var homeButton1: SelectLevelCustomButton!
    @IBOutlet weak var homeButton2: SelectLevelCustomButton!
    @IBOutlet weak var homeButton3: SelectLevelCustomButton!
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var dataImageView1: UIImageView!
    @IBOutlet weak var dataImageView2: UIImageView!
    @IBOutlet weak var dataImageView3: UIImageView!
    
    // プロパティ
    var selectTag = 0
    
    //表示
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        inspirationImageView.image = UIImage(named: "inspiration")
        charImageView.image = UIImage(named: "dog")
        dataImageView1.image = UIImage(named: "apple.blue")
        dataImageView2.image = UIImage(named: "apple.red")
        dataImageView3.image = UIImage(named: "apple.yellow")
        
        homeButton1.setTitle("基本問題", for: .normal)
        homeButton2.setTitle("応用問題", for: .normal)
        homeButton3.setTitle("発展問題", for: .normal)
    }
    
    // データ送る準備(タップされた難易度番号)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filedVC = segue.destination as! FiledSpecificViewController
        filedVC.selectLabel = selectTag
    }
    
    // タップされた時
    @IBAction func homeButtonAction(sender: UIButton) {
       // print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toFiledVC", sender: nil)
    }
}


