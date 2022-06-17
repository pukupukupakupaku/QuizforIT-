//
//  ExplanationViewController.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/12.
//

import UIKit
import SnapKit
import RealmSwift

// デリゲート
protocol ExplanationViewControllerDelegate: AnyObject {
    func nextButtonDidTap(_ viewController: ExplanationViewController)
}

class ExplanationViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    weak var delegate: ExplanationViewControllerDelegate?
    
    // データ受け取り及び表示させる
    var exData = "" {
        didSet {
            explanationTextLabel.text = exData
        }
    }
    
    var aquireChecked = false
    var reviewChecked = false
    var questionData = ""
    let aquire = Aquire()
    let review = Review()
    let realm = try! Realm()
   
    //土台のview
    lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    //モーダル＆UI
    lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.cyan
        button.setTitle("修得", for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.cyan
        button.setTitle("復習", for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.cyan
        button.setTitle("次へ", for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var explanationTextLabel: UILabel = {
        let explanationTextLabel = UILabel()
        //        explanationTextLabel.text = exData
        return explanationTextLabel
    }()
    
    lazy var judgeImage: UIImageView = {
        let judgeImage = UIImageView()
        if iscorrect {
            judgeImage.image = UIImage(named: "correct")
        } else {
            judgeImage.image = UIImage(named: "incorrect")
        }
        return judgeImage
    }()
    
    // これだと二つ同時に画面表示されてしまう
    //    lazy var correctImage: UIImageView = {
    //        let correctImage = UIImageView()
    //        correctImage.image = UIImage(named: "correct")
    //        return correctImage
    //    }()
    //
    //    lazy var incorrectImage: UIImageView = {
    //        let incorrectImage = UIImageView()
    //        incorrectImage.image = UIImage(named: "incorrect")
    //        return incorrectImage
    //    }()
    
    var iscorrect: Bool!
    
    
    // ？
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        self.transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    //layout
    func layoutView() {
        
        view.addSubview(baseView)
        view.addSubview(alertView)
        alertView.addSubview(button1)
        alertView.addSubview(button2)
        alertView.addSubview(nextButton)
        alertView.addSubview(judgeImage)
        //        alertView.addSubview(correctImage) = 上記に記載
        //        alertView.addSubview(incorrectImage)
        alertView.addSubview(explanationTextLabel)
        
        baseView.snp.makeConstraints{
            $0.size.equalTo(self.view)
        }
        
        alertView.snp.makeConstraints{
            $0.height.equalTo(self.view).multipliedBy(0.8)
            $0.width.equalTo(self.view).multipliedBy(0.8)
            $0.center.equalToSuperview()
        }
        
        button1.snp.makeConstraints{
            $0.leading.equalTo(40)
            $0.width.height.equalTo(60)
            $0.bottom.equalToSuperview().multipliedBy(0.9)
        }
        
        button2.snp.makeConstraints{
            $0.trailing.equalTo(-40)
            $0.width.height.equalTo(60)
            $0.bottom.equalToSuperview().multipliedBy(0.9)
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().multipliedBy(0.95)
            $0.width.equalToSuperview().multipliedBy(0.6)
        }
        
        explanationTextLabel.snp.makeConstraints{
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.centerY.centerX.equalToSuperview()
        }
        
        judgeImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        nextButton.addTarget(self, action: #selector(self.closeDidTap(_ :)), for: .touchUpInside)
        button1.addTarget(self, action: #selector(self.learnDidTap(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(reviewDidTap(_:)), for: .touchUpInside)
    }
    
    @objc func closeDidTap(_ sender: UIButton) {
        //print("tapされました")
        self.dismiss(animated: true) {
            self.delegate?.nextButtonDidTap(self)
        }
    }
    
    @objc func learnDidTap(_ sender: UIButton) {
        // print("修得されました")
        switch aquireChecked {
        case false:
            button1.setImage(UIImage(systemName: "checkmark"), for: .normal)
            aquireChecked = true
            try! realm.write {
                aquire.questionAquireName = questionData
                realm.add(aquire)
                // print(realm.objects(Aquire.self))
            }
        case true:
            button1.setImage(nil, for: .normal)
            aquireChecked = false
            try! realm.write{
                 realm.deleteAll()
                // print(realm.objects(Aquire.self))
            }
        }
    }
    
    @objc func reviewDidTap(_ sender: UIButton) {
        switch reviewChecked {
        case false:
            button2.setImage(UIImage(systemName: "checkmark"), for: .normal)
            reviewChecked = true
            try! realm.write {
                review.questionReviewName = questionData
                realm.add(review)
                //print(realm.objects(Review.self))
            }
        case true:
            button2.setImage(nil, for: .normal)
            reviewChecked = false
            try! realm.write{
                 realm.delete(review)
                //print(realm.objects(Review.self))
            }
        }
    }
    
    
    func sendData() {
        
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(true)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertAnimation(false)
    }
    
}


//  アラートviewのアニメーション
class AlertAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    //true: dismiss
    //false: present
    let isPresent: Bool
    
    init(_ isPresent: Bool) {
        self.isPresent = isPresent
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            dismissAnimation(transitionContext)
        } else {
            presentAnimation(transitionContext)
        }
    }
    
    //表示時のアニメーション
    func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        let alert = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ExplanationViewController
        
        let container = transitionContext.containerView
        
        alert.baseView.alpha = 0
        alert.alertView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        //すでにfromのviewControllerはaddSubviewされているので、addSubviewやinsertSubviewの必要はない
        container.addSubview(alert.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       animations: {
            alert.baseView.alpha = 0.7
            alert.alertView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) },
                       completion: { bool in
            UIView.animate(withDuration: 0.1, animations: {
                alert.alertView.transform = CGAffineTransform.identity
            })
            transitionContext.completeTransition(true) })
        
    }
    
    // 閉じるアニメーション
    func dismissAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let alert = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ExplanationViewController
        
        UIView.animate(withDuration: 0.3, animations: {
            alert.baseView.alpha = 0
            alert.alertView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
}



