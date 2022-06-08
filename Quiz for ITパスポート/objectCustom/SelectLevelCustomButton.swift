//
//  HomeButtonCustom.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/01.
//

import Foundation
import UIKit

@IBDesignable
class SelectLevelCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customDesign()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customDesign()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customDesign()
    }
    
    private func customDesign() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 50.0)
        layer.cornerRadius = 15.0
        layer.masksToBounds = true;
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds;
        gradientLayer.colors = [UIColor(displayP3Red: 0/255, green: 172/255, blue: 254/255,alpha: 1.0).cgColor, UIColor(displayP3Red: 79/255, green: 242/255, blue: 254/255,alpha: 1.0).cgColor]
        layer.insertSublayer(gradientLayer, at:0)
    }
}
