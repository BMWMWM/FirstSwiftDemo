//
//  MoyaApi.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/9.
//  Copyright © 2019 MWM. All rights reserved.
//

import Foundation
import Moya

enum MoyaAPI {
    case login(device_type:String, login_type:String, user_name:String, password:String)
}

extension MoyaAPI: TargetType {
    //必须实现
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var baseURL: URL {
        return URL.init(string: BaseUrl)!
    }
    var path: String {
        switch self {
        case .login(device_type: _, login_type: _, user_name: _, password: _):
            return KLoginPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(device_type: _, login_type: _, user_name: _, password: _):
            return .post
        }
    }
    
    var task: Task {
        var parameter = ["urlencode": "false", "app_type": "ios"]
        if let info = Bundle.main.infoDictionary {
            let version = info["MinimumOSVersion"] as! String
            parameter["version"] = version
        }
        switch self {
        case let .login(device_type, login_type, user_name, password):
            parameter["device_type"] = device_type
            parameter["login_type"] = login_type
            parameter["user_name"] = user_name
            parameter["password"] = password

            return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        return nil
    }
    
}
