//
//  ExtensionButton.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/11.
//

import UIKit

extension UIButton {
    func setPadding(_ padding: CGFloat) {
        self.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -padding)
    }
}
