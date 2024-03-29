//
//  MWMBaseNaviViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/8/29.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit

class MWMBaseNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeSet()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //隐藏底部tabBar
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageName: "nav_btn_back_white", higImageName: "", size: .zero, target: self, action: #selector(navBack))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    //改变状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //退出键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //返回
    @objc func navBack() {
        self.popViewController(animated: true)
    }
}

extension MWMBaseNaviViewController {
    fileprivate func initializeSet() {
    //设置字体大小和颜色
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
    //设置背景色
    UINavigationBar.appearance().barTintColor = UIColor.orange
    //设置半透明
    UINavigationBar.appearance().isTranslucent = false
    // 4.设置导航栏背景图片
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    // 5.设置导航栏阴影图片
    UINavigationBar.appearance().shadowImage = UIImage()
    }
}
