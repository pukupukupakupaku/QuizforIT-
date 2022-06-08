//
//  FiledSpecificViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/02.
//

import UIKit
import Parchment

class FiledSpecificViewController: UIViewController {
    
    
    var selectLabel = 0
    var csvArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("選択されたのは\(selectLabel)です")
        
        let  firstViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        firstViewController?.title = "企業・法務"
        firstViewController?.data = ["あいうえお", "かきくけこ"]
        
        let secoundViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        secoundViewController?.data = ["あいうえお", "かきくけこ", "たちつてと"]
        secoundViewController?.title = "経営戦略"
        let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        
        thirdViewController?.title = "システム戦略"
        let fourthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        fourthViewController?.title = "開発技術"
        let fifthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        fifthViewController?.title = "プロジェクトマネジメント"
        let sixthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        sixthViewController?.title = "サービスマネジメント"
        let seventhViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        seventhViewController?.title = "基礎理論"
        let eighthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        eighthViewController?.title = "コンピュータシステム"
        let ninethViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
        ninethViewController?.title = "技術要素"
        
        let pagingViewController =  PagingViewController(viewControllers: [
            firstViewController,
            secoundViewController,
            thirdViewController,
            fourthViewController,
            fifthViewController,
            sixthViewController,
            seventhViewController,
            eighthViewController,
            ninethViewController].compactMap{ $0 })
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        [pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         pagingViewController.view.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
         pagingViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)]
            .forEach{ $0.isActive = true}
    }
    
    //    func LoadCSV(fileName: String) -> [String] {
    //        let loadBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
    //        do {
    //            let csvData = try String(contentsOfFile: loadBundle, encoding: String.Encoding.utf8)
    //            let lineChange = csvData.replacingOccurrences(of: "/r", with: "/n")
    //            csvArray = lineChange.components(separatedBy: "/n")
    //            csvArray.removeLast()
    //        } catch {
    //            print("エラー")
    //        }
    //        return csvArray
    //    }
}





