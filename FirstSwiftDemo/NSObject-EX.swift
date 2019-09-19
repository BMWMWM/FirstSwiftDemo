//
//  NSObject-EX.swift
//  FirstSwiftDemo
//
//  Created by xhkj on 2019/8/29.
//  Copyright © 2019 MWM. All rights reserved.
//

import Foundation
extension NSObject {
    func classFromClassName(className: String) -> AnyClass? {
        assert(!className.isEmpty, "传入的类名为空")
        let classBefore = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        let classRes: AnyClass? = NSClassFromString(classBefore! + "." + className)
        return classRes
    }
}
