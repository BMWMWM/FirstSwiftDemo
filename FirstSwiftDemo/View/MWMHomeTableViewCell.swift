//
//  MWMHomeTableViewCell.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/2.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
fileprivate let homeCellID = "homeCellID"

class MWMHomeTableViewCell: UITableViewCell {
    var testLabel : UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addChildView()
        layoutChildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
//初始化label
extension MWMHomeTableViewCell {
    fileprivate func addChildView(){
        testLabel = UILabel()
        testLabel?.textColor = UIColor.black
        contentView.addSubview(testLabel!)
    }
}
extension MWMHomeTableViewCell {
    fileprivate func layoutChildView(){
        testLabel?.frame = CGRect(x: 10, y: 0, width: bounds.size.width - 20, height: bounds.size.height)
    }
}
extension MWMHomeTableViewCell {
    class func homeCellWithTableView(_ tableview: UITableView) -> UITableViewCell{
        var cell = tableview.dequeueReusableCell(withIdentifier: homeCellID) as? MWMHomeTableViewCell
        if cell == nil {
            cell = MWMHomeTableViewCell(style: .default, reuseIdentifier: homeCellID)
        }
        return cell!
        
    }
}
