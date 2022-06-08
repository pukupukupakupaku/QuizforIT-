//
//  FieldViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/06.
//

import UIKit
import SnapKit

class FieldViewController: UIViewController {
    
    var data: [String] = [] {
        didSet {
            data.forEach { element in
                let button = UIButton()
                button.setTitle(element, for: .normal)
                button.backgroundColor = .blue
                stackView.addArrangedSubview(button)
            }
        }
    }
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
