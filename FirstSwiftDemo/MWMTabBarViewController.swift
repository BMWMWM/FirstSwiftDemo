//
//  MWMTabBarViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/8/27.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
fileprivate let  TabBarItemInfo = "TabBarItemConfig"
class MWMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //设置tabbar选项
        let itemUrl: String? = Bundle.main.path(forResource: TabBarItemInfo, ofType: "plist")
        if itemUrl == nil {return}
        let dictItemArr: NSArray? = NSArray(contentsOfFile: itemUrl!)
        if dictItemArr == nil {return}
        dictItemArr?.enumerateObjects({
            (obj, idx, stop) in
            guard let itemDict = obj as? [String : NSObject] else{return}
            let claN: String = itemDict["vc"] as! String
            //类名通过类名转化为类
            let cls: AnyClass! = classFromClassName(className: claN)
            if cls == nil {return}
            
            let vcCls = cls as! UIViewController.Type
            let vc = vcCls.init()
            addChildVC(vc: vc, title: itemDict["title"] as! NSString, imageName: itemDict["normalImageName"] as! NSString, selImageName: itemDict["selImageName"] as! NSString)
        })
    }
}
extension MWMTabBarViewController {
    fileprivate func addChildVC(vc:UIViewController, title: NSString, imageName: NSString, selImageName: NSString) {
        var norImage: UIImage = UIImage(named: imageName as String)!
        var selImage: UIImage = UIImage(named: selImageName as String)!
        norImage = norImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        selImage = selImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem = UITabBarItem.init(title: title as String, image: norImage, selectedImage: selImage)
        //改变字体颜色
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(r: 255, g: 211, b: 59)], for: .selected)
        vc.title = title as String
        let nav = MWMBaseNaviViewController(rootViewController: vc)
        addChild(nav)
    }
    
}
