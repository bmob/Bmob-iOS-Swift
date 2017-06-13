//
//  BmobRequestWork.swift
//  BmobSMS
//
//  Created by ybon on 2017/6/5.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

class BmobRequestWork: NSObject {
    /**
     GET
     */
    class func zyGETWithURLSession(_ urlString:String,parmas:NSDictionary,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
        
        let session = URLSession.shared;
        let str = self.parmasStringWithParmas(parmas);
        
        let resultstr = str.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed);
        
        let url = URL.init(string: urlString+"?"+resultstr!);
        
        var request = URLRequest(url: url!);
        
        request.httpMethod = "GET";
        
       
        request.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        request.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            if data != nil{
              
                do {
                    try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    mathFunction(responsobject! as AnyObject,true,nil);
                } catch {
                    mathFunction("数据转换失败" as AnyObject,false,nil);
                }
                
            }else{
                mathFunction("请求失败" as AnyObject,false,error);
            }
        })
        task.resume();
        
    }
    /**
     POST
     */
    class func zyPOSTwithURLSession(_ urlString:String,parmas:NSDictionary,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
        
        
        
        let session = URLSession.shared;
        
        let str = self.parmasStringWithParmas(parmas);
        let url = URL(string: urlString);
        
        var request = URLRequest(url: url!);
        
        request.httpMethod = "POST";
        
        request.httpBody = str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue));
        request.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        request.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        if (BmobSDK.shareBmobSDK().sessionToken != nil) {
            request.setValue(BmobSDK.shareBmobSDK().sessionToken, forHTTPHeaderField: "X-Bmob-Session-Token");
        }
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            if data != nil{
                
                do {
                    try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    mathFunction(responsobject! as AnyObject,true,nil);
                } catch {
                    mathFunction("数据转换失败" as AnyObject,false,nil);
                }
                
            }else{
                mathFunction("请求失败" as AnyObject,false,error);
            }
        })
        
        task.resume();
    }
 
    /**
     up data
     */
    class func zyUpwithURLSession(_ urlString:String,parmas:Dictionary<String,Any>,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
  
        let session = URLSession.shared;
        
        let url = URL(string: urlString);
        
        var request = URLRequest(url: url!);
        
        request.httpMethod = "PUT";
        request.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        request.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        if (BmobSDK.shareBmobSDK().sessionToken != nil) {
            request.setValue(BmobSDK.shareBmobSDK().sessionToken, forHTTPHeaderField: "X-Bmob-Session-Token");
        }
        let jsonData = try?JSONSerialization.data(withJSONObject: parmas, options: JSONSerialization.WritingOptions.prettyPrinted);
        request.httpBody = jsonData! as Data;
       
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            if data != nil{
                
                do {
                    try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    mathFunction(responsobject! as AnyObject,true,nil);
                } catch {
                    mathFunction("数据转换失败" as AnyObject,false,nil);
                }
                
            }else{
                mathFunction("请求失败" as AnyObject,false,error);
            }
        })

        task.resume();
    }
    /**
     delete
     */
    class func zyDeletewithURLSession(_ urlString:String,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
        
        let session = URLSession.shared;
        
        let url = URL(string: urlString);
        
        var request = URLRequest(url: url!);
        
        request.httpMethod = "DELETE";
        request.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        request.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
       
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            if data != nil{
                
                do {
                    try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    mathFunction(responsobject! as AnyObject,true,nil);
                } catch {
                    mathFunction("数据转换失败" as AnyObject,false,nil);
                }
                
            }else{
                mathFunction("请求失败" as AnyObject,false,error);
            }
        })

        task.resume();
    }
    /**
     POST  ROW请求格式请求
     */
    class func zyRowPOSTwithURLSession(_ urlString:String,parmas:Dictionary<String,Any>,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
        
        let session = URLSession.shared;
        
        let url = URL(string: urlString);
        
        var request = URLRequest(url: url!);
        
        request.httpMethod = "POST";
        let jsonData = try?JSONSerialization.data(withJSONObject: parmas, options: JSONSerialization.WritingOptions.prettyPrinted);
        request.httpBody = jsonData;
        request.setValue(BmobSDK.shareBmobSDK().app_ID, forHTTPHeaderField: "X-Bmob-Application-Id");
        request.setValue(BmobSDK.shareBmobSDK().fulKey, forHTTPHeaderField: "X-Bmob-REST-API-Key");
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        if (BmobSDK.shareBmobSDK().sessionToken != nil) {
            request.setValue(BmobSDK.shareBmobSDK().sessionToken, forHTTPHeaderField: "X-Bmob-Session-Token");
        }
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            if data != nil{
                
                do {
                    try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
                    mathFunction(responsobject! as AnyObject,true,nil);
                } catch {
                    mathFunction("数据转换失败" as AnyObject,false,nil);
                }
                
            }else{
                mathFunction("请求失败" as AnyObject,false,error);
            }
        })
        task.resume();
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
