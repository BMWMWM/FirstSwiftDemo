//
//  MWMHomeViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/8/29.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit

fileprivate let homeCellID = "homeCellID"

class MWMHomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
//懒加载 初始化tableView
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        return tableView
    }()
    fileprivate lazy var dataArr : NSArray = {
        return ["lable","button","imageView","textView","collectionView","去登录界面模拟登录操作"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.andomColor()
        view.addSubview(tableView)
    }
}
//扩展
extension MWMHomeViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MWMHomeTableViewCell.homeCellWithTableView(tableView) as? MWMHomeTableViewCell
        cell?.testLabel?.text = dataArr[indexPath.row] as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let vc = MWMHomeDetailViewController()
        let loginVC = MWMLoginViewController()
        if indexPath.row == 0 {
            vc.kitType = .UIKitTypeLable
        }
        if indexPath.row == 1 {
            vc.kitType = .UIKitTypeButton
        }
        if indexPath.row == 2 {
            vc.kitType = .UIKitTypeImageView
        }
        if indexPath.row == 3 {
            vc.kitType = .UIKitTypeTextView
        }
        if indexPath.row == 4 {
            vc.kitType = .UIKitTypeCollectionView
        }
        if indexPath.row < 5 {
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}

