//
//  MWMLoginModel.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/19.
//  Copyright © 2019 MWM. All rights reserved.
//

import UIKit
import ObjectMapper
class MWMLoginModel: Mappable {
    var user_id : String?
    var unique_id : String?
    var wx_unionid : String?
    var user_name : String?
    var nick_name : String?
    var u_pic : String?
    var is_active : String?
    var is_bind_wx : String?
    var mobile : String?
    var logins : String?
    var status : String?
    var ctime : String?
    var user_token : String?
    var source : String?
    var refer_user : String?
    var perfect_userinfo : String?
    var goto_page : String?
    var im_userid : String?
    var is_authentic : String?
    var is_vip : String?

    required init?(map: Map) {
    }
    func mapping(map: Map) {
        user_id <- map["user_id"]
        unique_id <- map["unique_id"]
        wx_unionid <- map["wx_unionid"]
        user_name <- map["user_name"]
        nick_name <- map["nick_name"]
        u_pic <- map["u_pic"]
        is_active <- map["is_active"]
        is_bind_wx <- map["is_bind_wx"]
        mobile <- map["mobile"]
        logins <- map["logins"]
        status <- map["status"]
        ctime <- map["ctime"]
        user_token <- map["user_token"]
        source <- map["source"]
        refer_user <- map["refer_user"]
        perfect_userinfo <- map["perfect_userinfo"]
        im_userid <- map["im_userid"]
        is_authentic <- map["is_authentic"]
        is_vip <- map["is_vip"]
    }
}
