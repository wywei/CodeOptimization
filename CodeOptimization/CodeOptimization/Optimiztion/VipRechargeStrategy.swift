//
//  VipRechargeStrategy.swift
//  CodeOptimization
//
//  Created by Andy on 2022/9/21.
//

import UIKit

/*
  根据价格包区分给用户增加不同的体育会员视频VIP天数
 */

public protocol VipRechargeStrategy {
    func recharge(priceCode: String)
}


public class OneMonthVipStrategy: VipRechargeStrategy {
    
    public func recharge(priceCode: String) {
        print("充值一个月WWE体育会员到账")
    }
}

public class ThreeMonthVipStrategy: VipRechargeStrategy {
    
    public func recharge(priceCode: String) {
        print("充值三个月WWE体育会员到账")
    }
}

public class YearVipStrategy: VipRechargeStrategy {
    
    public func recharge(priceCode: String) {
        print("充值一年WWE体育会员到账")
    }
    
}


public class Context {
    
    var strage: VipRechargeStrategy?
    
    // 缺点: 这里还是没有摆脱 if else
    func payNotify(priceCode: String) {
        switch priceCode {
        case "充值一个月会员":
            strage = OneMonthVipStrategy()
        case "充值三个月会员":
            strage = ThreeMonthVipStrategy()
        case "充值一年月会员":
            strage = YearVipStrategy()
        default:
            fatalError("其他")
        }
        
        strage?.recharge(priceCode: priceCode)
    }
}
