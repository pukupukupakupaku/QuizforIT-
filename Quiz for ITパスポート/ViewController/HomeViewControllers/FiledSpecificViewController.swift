//
//  FiledSpecificViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/02.
//

import UIKit
import Parchment
import SwiftyJSON

class FiledSpecificViewController: UIViewController {
    
    var pagingViewController: PagingViewController!
    
    //　データ受け取り
    var selectLabel = 0 {
        didSet {
            setupViewControllers()
        }
    }
    
    // 受け取ったデータをjsonで受け取れるように
    var level: String {
        get {
            let levels = ["basic", "advance", "top"]
            return levels[selectLabel - 1]
        }
    }
    
    //perchmentライブラリに従って、tabMenu作成
    lazy var firstViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
    
    lazy var secoundViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController

    lazy var thirdViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
    
    lazy var fourthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
   
    lazy var fifthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
   
    lazy var sixthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
    
    lazy var seventhViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
   
    lazy var eighthViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
    
    lazy var ninethViewController = storyboard?.instantiateViewController(withIdentifier: "fieldViewController") as? FieldViewController
    
    lazy var viewControllers = [
        firstViewController,
        secoundViewController,
        thirdViewController,
        fourthViewController,
        fifthViewController,
        sixthViewController,
        seventhViewController,
        eighthViewController,
        ninethViewController
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func setupViewControllers() {
        print("選択されたのは\(level)です")
        
        do {
            let json = try loadJson()
            let levelData = json[level]
            //print(levelData)
        
            
            let viewControllers = zip(
                self.viewControllers,
                (levelData.array?.compactMap { $0.dictionary })!
            )
                .compactMap { vc, data -> UIViewController? in
                    guard let key = data.keys.first else { return nil }
                    vc?.title = key
                    vc?.data = data[key]?.array
                    return vc
                }
            pagingViewController =  PagingViewController(viewControllers: viewControllers)
            //pagingViewController.sizeDelegate = self
            
            addChild(pagingViewController)
            view.addSubview(pagingViewController.view)
            pagingViewController.didMove(toParent: self)
            pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            [pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             pagingViewController.view.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
             pagingViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)]
                .forEach{ $0.isActive = true}
        } catch {
            print(error)
        }

    }
    
    // データ読み込み
    private func loadJson() throws -> JSON {
        guard let loadBundle = Bundle.main.url(forResource: "template", withExtension: "json") else {
            throw "failed to fetch full name path"
        }
        let jsonData = try Data(contentsOf: loadBundle)
        let json = try JSON(data: jsonData)
        return json
    }
}


extension String: LocalizedError { }


// extension FiledSpecificViewController: PagingViewControllerSizeDelegate {
    
//    func pagingViewController(_: PagingViewController, widthForPagingItem pagingItem: PagingItem, isSelected: Bool) -> CGFloat {
//        print(pagingItem.identifier)
//        guard let firstIndex = pagingViewController.visibleItems.items.firstIndex(where:  {
//            return $0.isEqual(to: pagingItem)
//        }) else {
//           return 160
//        }
//        if let title = viewControllers[firstIndex]?.title {
//            return calculateWidth(from: title)
//        }
//        else {
//            return 160
//        }
//        
//    }
//    
//    private func calculateWidth(from title: String) -> CGFloat {
//        return CGFloat(title.count * 16 + 100)
//    }
    
//}
