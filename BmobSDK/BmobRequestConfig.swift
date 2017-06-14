//
//  BmobRequestConfig.swift
//  BmobSDKTest
//
//  Created by ybon on 2017/6/14.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

let BmobQueryUrl = "https://api.bmob.cn/1/classes/";
let BmobUserUrl = "https://api.bmob.cn/1/";
let BmobFileUrl = "https://api.bmob.cn/2/files/";
public typealias zymathFuncation = (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void


class BmobRequestConfig: NSObject {

    /**
     * 返回请求结果
     */
    func requestTask(data:Data?,response:URLResponse?, error:Error?) -> (anyObject:AnyObject,isSuccess:Bool,zyError:Error?){
        
        if data != nil{
            
            do {
                try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
               return (responsobject! as AnyObject,true,nil);
            } catch {
               return ("数据转换失败" as AnyObject,false,nil);
            }
            
        }else{
            return ("请求失败" as AnyObject,false,error);
        }
    }
    //添加request请求头
    class func setRequestHeader(request:URLRequest) -> URLRequest{
        var multrequest = request;
        
        
        multrequest.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        if (BmobSDK.shareBmobSDK().fulKey != nil){
            multrequest.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        }
        if (BmobSDK.shareBmobSDK().app_ID != nil){
            multrequest.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        }
        if (BmobSDK.shareBmobSDK().sessionToken != nil) {
            multrequest.setValue(BmobSDK.shareBmobSDK().sessionToken, forHTTPHeaderField: "X-Bmob-Session-Token");
        }
        return multrequest;
    }
    //拼接GET参数
    class func parmasStringWithParmas(_ parmas:NSDictionary)->String{
        
        var parString = String();
        let arr = parmas.allKeys as NSArray;
        for i in 0 ..< arr.count{
            let key = arr[i] as! String;
            let value = parmas.object(forKey: arr[i]);
            parString = String.init(format: "%@%@=%@", parString,key,value as! CVarArg);
            
            let lastKey = arr.lastObject as! String;
            if (key != lastKey) {
                
                parString = parString + "&";
            }
  
        }
        return parString;
    }
}
