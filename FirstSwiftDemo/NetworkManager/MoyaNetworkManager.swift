//
//  MoyaNetworkManager.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/9/9.
//  Copyright © 2019 MWM. All rights reserved.
//

import Foundation
import Moya
import Alamofire

//超时时长
private var requestTimeout: Double = 60
//数据成功回调
typealias successCallback = ((Any) -> (Void))
//数据失败回调
typealias failedCallback = ((String) -> (Void))

//构造Endpoint
private let myEndpointClosure = {
    (target: MoyaAPI) -> Endpoint in
    let url = target.baseURL.absoluteString + target.path
    var endpoint = Endpoint(
        url: url, sampleResponseClosure: {
        .networkResponse(200, target.sampleData)
    },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    return endpoint
}

//设置网络请求
private let requestClosure = {
    (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeout
        //打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)" + "\n" + " \(request.httpMethod ?? "")" + "发送参数" + "\(String(data:request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

//NetworkActivityPlugin插件用来监听网络请求
private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    debugPrint("networkPlugin \(changeType)")
    //targetType 是当前请求的基本信息
    switch(changeType){
    case .began:
        print("开始请求网络")
    case .ended:
        print("结束")
    }
}
class MWMNetworkManager {
    static let shared = MWMNetworkManager()
    //网络请求 核心方法 创建网络请求对象
    let Provider = MoyaProvider<MoyaAPI>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)
    
    func NetworkRequest(_ target:MoyaAPI, completion:@escaping successCallback, faild:failedCallback?) {
        Provider.request(target) { (result) in
            switch result {
            case let .success(response):
                do {
                    let responseObject = try JSONSerialization.jsonObject(with:response.data)
                    guard let dic = responseObject as? Dictionary<String, Any>,let _ = String(data: response.data, encoding: String.Encoding.utf8) else {
                        debugPrint("不是json数据？？？")
                        return
                    }
                    completion(dic)
                    
                } catch {
                    
                }
            case let .failure(error): faild!(error.localizedDescription)
            }
        }
    }

}
