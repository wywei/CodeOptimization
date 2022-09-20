//
//  VipRechargeFactory.swift
//  CodeOptimization
//
//  Created by Andy on 2022/9/21.
//

import UIKit

public class VipRechargeFactory {
    
    static let shared = VipRechargeFactory()
    
    lazy var map: [String: VipRechargeStrategy] = [
        "充值一个月会员": OneMonthVipStrategy(),
        "充值三个月会员": ThreeMonthVipStrategy(),
        "充值一年会员":  YearVipStrategy()
    ]

    func getConcreteStrategy(priceCode code: String) -> VipRechargeStrategy? {
        return map[code]
    }
  
}


public class Context1 {
    
    static func payNotify(priceCode: String) {
        guard let staragegy = VipRechargeFactory.shared.getConcreteStrategy(priceCode: priceCode) else { return }
        
        staragegy.recharge(priceCode: priceCode)
    }
    
}
