//
//  MWMLoginViewController.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/18.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
import ObjectMapper
class MWMLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label =  UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        label.text = "我是一个label"
        label.textColor = UIColor.orange
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        let label2 =  UILabel()
        label2.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        label2.text = "我也是一个label"
        label2.textColor = UIColor.orange
        label2.numberOfLines = 0
        label2.textAlignment = .center
        view.addSubview(label2)
    MWMNetworkManager.shared.NetworkRequest(.login(device_type: UIDevice.current.systemName, login_type: "0", user_name: "15700156949", password: "123456"), completion: { (responseObjc) -> (Void) in
            print("===\(responseObjc)===")
        let model = Mapper<MWMBaseModel<MWMLoginModel>>().map(JSON: responseObjc as! [String : Any])
        if model?.code == 1 {
            label.text = "登录成功";
            label2.text = "登录成功，用户名为" + (model?.data?.user_name)!
        }
        
        }) { (errStr) -> (Void) in
            print("===\(errStr)===")
            
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
