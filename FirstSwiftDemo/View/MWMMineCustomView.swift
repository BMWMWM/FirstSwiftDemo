//
//  MWMMineCustomView.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/9.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
import SnapKit
class MWMMineCustomView: UIView {
    
    var testStr : String? {
        didSet {
            testLabel.text = testStr
        }
    }
    fileprivate lazy var testLabel : UILabel = {
        let testLabel = UILabel()
        testLabel.textColor = UIColor.green
        return testLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(testLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.size.equalTo(200)
            ConstraintMaker.center.equalToSuperview()
        }
    }
}
