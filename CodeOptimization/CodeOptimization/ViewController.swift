//
//  ViewController.swift
//  CodeOptimization
//
//  Created by Andy on 2022/9/20.
//

/*
 背景:在支付回调中根据用户购买的价格包赋予用户对应的权益(VIP视频会员天数+抽奖机会次数)
 */
import UIKit

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func checkoutToken(_ uid: String, _ token: String) -> Bool {
        // 逻辑判断省略...
        
        return true
    }
    
    func subStringNewsSummary(str: String, parmas: NewsSummaryParamsVo?) -> String {
        // 省略...
        
        
        return ""
    }
    
    /// 最垃圾的代码
    func newsSummary(str: String, parmas: NewsSummaryParamsVo?) -> String {
        
        do {
            if parmas != nil {
                if parmas?.uID != nil && parmas?.token != nil {
                    let flag = checkoutToken(parmas?.uID ?? "",  parmas?.token! ?? "")
                    
                    if flag {
                        return subStringNewsSummary(str: str, parmas: parmas)
                    } else {
                        return "token 验证失败"
                    }
                } else {
                    return "uid | token 不能为空"
                }
            } else {
                return "parama 不能为空"
            }
            
        } catch {
            fatalError("system error")
        }
    }
    
    // 优化一
    func newsSummary1(str: String, parmas: NewsSummaryParamsVo?) -> String {
        do {
            guard parmas != nil else { return "params not nil" }
            guard let uid = parmas?.uID,let token = parmas?.token else { return "uid | token 不能为空" }
            if !checkoutToken(uid, token) {
                return "token 验证失败"
            }
            return subStringNewsSummary(str: str, parmas: parmas)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}




struct NewsSummaryParamsVo {
    var uID: String?
    var token: String?
}


