//
//  FieldViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/06.
//

import UIKit
import SwiftyJSON
import SnapKit

class FieldViewController: UIViewController {
    
    var fieldSelect = 0
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    var data: [JSON]! {
        didSet {

            for (index,json) in data.enumerated() {
                guard let dic = json.dictionary,
                      let key = dic.keys.first,
                      let count = dic.values.first?.array?.count
                else { return }
//                print(subTitle)
                let button = FieldSelectButton()
                button.titleLabel.text = key
                button.questionCount.text = String(count)
                button.layer.cornerRadius = 15
                button.clipsToBounds = true
                let gesture = TagTapGesture(target: self, action: #selector(subTitleButtonTapped(_:)))
                gesture.tag = index
                button.addGestureRecognizer(gesture)
                stackView.addArrangedSubview(button)
                button.snp.makeConstraints {
                    $0.width.equalToSuperview()
                    $0.height.equalTo(120)
                }
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toPrepraVC = segue.destination as! PrepareQuizViewController
        toPrepraVC.jsonData = data[fieldSelect]
    }
    
    @objc func subTitleButtonTapped(_ sender: TagTapGesture) {
        print(sender.tag)
        fieldSelect = sender.tag
        performSegue(withIdentifier: "toPrepareVC", sender: nil)
    }
    
}

class TagTapGesture : UITapGestureRecognizer {
    var tag = 0
}
