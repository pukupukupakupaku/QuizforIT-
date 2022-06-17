//
//  TestSelectButton.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/12.
//

import UIKit

class TestSelectButton: UIView {
    @IBOutlet weak var testSelectLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibInit()
    }
    
    // ストーリーボードで配置した時の初期化処理
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibInit()
    }
    
    // xibファイルを読み込んでviewに重ねる
    fileprivate func nibInit() {
        
        // File's OwnerをXibViewにしたので ownerはself になる
        guard let view = UINib(nibName: "FieldSelectButton", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.addSubview(view)
    }
}
