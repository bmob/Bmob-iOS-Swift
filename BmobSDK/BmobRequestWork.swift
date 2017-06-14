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
    class func zyGETWithURLSession(_ urlString:String,parmas:NSDictionary,_ mathFunction: @escaping zymathFuncation){
        
        let session = URLSession.shared;
        let str = BmobRequestConfig.parmasStringWithParmas(parmas);
        let resultstr = str.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed);
        let url = URL.init(string: urlString+"?"+resultstr!);
        var request = URLRequest(url: url!);
        request.httpMethod = "GET";
        request = BmobRequestConfig.setRequestHeader(request: request);
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })
        task.resume();
        
    }
    /**
     POST
     */
    class func zyPOSTwithURLSession(_ urlString:String,parmas:NSDictionary,_ mathFunction: @escaping zymathFuncation){

        let session = URLSession.shared;
        let str = BmobRequestConfig.parmasStringWithParmas(parmas);
        let url = URL(string: urlString);
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request.httpBody = str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue));
        request = BmobRequestConfig.setRequestHeader(request: request);
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })
        
        task.resume();
    }
 
    /**
     update
     */
    class func zyUpwithURLSession(_ urlString:String,parmas:Dictionary<String,Any>,mathFunction:@escaping (_ responObject:AnyObject,_ isSuccess:Bool,_ zyError:Error?)->Void){
  
        let session = URLSession.shared;
        let url = URL(string: urlString);
        var request = URLRequest(url: url!);
        request.httpMethod = "PUT";
        request = BmobRequestConfig.setRequestHeader(request: request);
        let jsonData = try?JSONSerialization.data(withJSONObject: parmas, options: JSONSerialization.WritingOptions.prettyPrinted);
        request.httpBody = jsonData! as Data;
       
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })

        task.resume();
    }
    /**
     delete
     */
    class func zyDeletewithURLSession(_ urlString:String,_ mathFunction: @escaping zymathFuncation){
        
        let session = URLSession.shared;
        let url = URL(string: urlString);
        var request = URLRequest(url: url!);
        request.httpMethod = "DELETE";
        request = BmobRequestConfig.setRequestHeader(request: request);
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })

        task.resume();
    }
    /**
     POST  ROW请求格式请求
     */
    class func zyRowPOSTwithURLSession(_ urlString:String,parmas:Dictionary<String,Any>,_ mathFunction: @escaping zymathFuncation){
        let session = URLSession.shared;
        let url = URL(string: urlString);
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        let jsonData = try?JSONSerialization.data(withJSONObject: parmas, options: JSONSerialization.WritingOptions.prettyPrinted);
        request.httpBody = jsonData;
        
        request = BmobRequestConfig.setRequestHeader(request: request);
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })
        task.resume();
    }

    
}
