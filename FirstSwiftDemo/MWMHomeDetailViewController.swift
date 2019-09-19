//
//  MWMHomeDetailViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/5.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit

fileprivate let KItemMargin : CGFloat = 10
fileprivate let KitemW = (KscreenWidth - KItemMargin * 3) / 2
fileprivate let KitemH = KitemW * 6 / 5
fileprivate let KCollectionCellID = "KCollectionCellID"

enum UIKitType: Int{
    case UIKitTypeLable = 0
    case UIKitTypeButton
    case UIKitTypeImageView
    case UIKitTypeTextView
    case UIKitTypeCollectionView
}

class MWMHomeDetailViewController: UIViewController {
    var kitType : UIKitType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        self.title = "UIKit控件的简单使用"
        kitDis()
        
    }
    
    deinit {
        print("vc释放了")
    }

}
extension MWMHomeDetailViewController{
    fileprivate func kitDis() {
        
        if kitType == .UIKitTypeLable {
            let label =  UILabel()
            label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            label.text = "我是一个label"
            label.textColor = UIColor.orange
            label.numberOfLines = 0
            label.textAlignment = .center
            view.addSubview(label)
        }
        if kitType == .UIKitTypeButton {
            let btn = UIButton(type: .custom)
//            btn.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
            btn.frame = CGRect(origin: .zero, size: CGSize(width: KscreenWidth, height: KscreenHeight))
            btn.titleLabel?.text = "我是一个按钮"
            btn.setTitle("这是我的常规状态", for: .normal)
            btn.setTitleColor(UIColor.orange, for: .normal)
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            view.addSubview(btn)
        }
        if kitType == .UIKitTypeImageView {
            let imageView = UIImageView(image: UIImage(named: "imageBack"))
            imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            view.addSubview(imageView)
        }
        if kitType == .UIKitTypeTextView {
            let textView = UITextView()
            textView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
            textView.placeholder = "我是textView的placeholder"
            textView.placeholderColor = UIColor.green
            textView.font = UIFont.systemFont(ofSize: 13)
            textView.textColor = UIColor.orange
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.orange.cgColor
            textView.layer.cornerRadius = 5;
            textView.layer.masksToBounds = true
            view .addSubview(textView)
            
        }
        if kitType == .UIKitTypeCollectionView {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: KitemW, height: KitemH)
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
            let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
            collectionView.contentInset = UIEdgeInsets(top: 5, left: KItemMargin, bottom: 0, right: KItemMargin)
            collectionView.backgroundColor = UIColor.white
            //注册cell
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KCollectionCellID)
            collectionView.autoresizingMask = [.flexibleHeight,.flexibleHeight]
            collectionView.dataSource = self
            collectionView.delegate = self
            view.addSubview(collectionView)
            
        }
    }
    @objc fileprivate func btnClick(btn:UIButton){
        print("点击了btn")
        btn.isSelected = !btn.isSelected
        btn.setTitleColor(btn.isSelected ? UIColor.red : UIColor.orange, for: .normal)
    }
}
extension MWMHomeDetailViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCollectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.andomColor()
        return cell
    }
}
