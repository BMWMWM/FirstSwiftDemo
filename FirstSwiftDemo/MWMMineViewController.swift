//
//  MWMMineViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/8/29.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit

class MWMMineViewController: UIViewController {

    fileprivate lazy var mineView: MWMMineCustomView = {
        let mineView = MWMMineCustomView()
        mineView.testStr = "这是自定义的view"
        return mineView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.andomColor()
        view.addSubview(mineView)
        mineView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
