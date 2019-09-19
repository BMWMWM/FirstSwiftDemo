//
//  MWMBaseModel.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/19.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
import ObjectMapper
class MWMBaseModel<T:Mappable>: Mappable {
    var code : Int?
    var data : T?
    var msg : String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        msg <- map["msg"]
    }
}

//列表类型的model
class MWMBaseListModel<T:Mappable>: Mappable {
    var code : Int?
    var data : [T]?
    var msg : String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        msg <- map["msg"]
    }
}
