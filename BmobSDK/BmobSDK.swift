//
//  BmobSDK.swift
//  Bmob
//
//  Created by ybon on 2017/6/13.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

public class BmobSDK: NSObject {
    var app_ID:String?;
    var fulKey:String?;
    //当前登录用户ID
    var currentUserID:String?;
    //当前登录用户Token
    var sessionToken:String?;
    
    //单例
    static let instance = BmobSDK.init();
    public class func shareBmobSDK()->BmobSDK{
        
        return instance;
    }
    
    /**注册应用*/
    public func registApp(appID:String,restFulKey:String){
        app_ID = appID;
        fulKey = restFulKey;
        
    }
}
