//
//  BmobFileRequestWork.swift
//  BmobSDKTest
//
//  Created by ybon on 2017/6/14.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

class BmobFileRequestWork: NSObject {
    
    /**
     * upload image
     */
    class func uploadImage(_ urlString:String,image:UIImage,_ mathFunction: @escaping zymathFuncation){
        
        let session = URLSession.shared;
        let url = URL.init(string: urlString);
        
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        
        request.setValue("image/jpeg", forHTTPHeaderField: "Content-Type");
        
        let filedata:Data = UIImageJPEGRepresentation(image, 0.5)!;
       
        request = BmobRequestConfig.setRequestHeader(request: request);
        
        let task = session.uploadTask(with: request, from: filedata) { (data, response, error) in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: response, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        }
        task.resume();
        
    }
    /**
     * upload file
     */
    class func uploadFile(_ urlString:String,_ fileType:String,_ filePath:String,_ mathFunction: @escaping zymathFuncation){
        let session = URLSession.shared;
        let url = URL.init(string: urlString);
        
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request.setValue(fileType, forHTTPHeaderField: "Content-Type");
        
        let filedata:Data = try!Data.init(contentsOf: URL.init(fileURLWithPath: filePath));
        
        request = BmobRequestConfig.setRequestHeader(request: request);
        
        let task = session.uploadTask(with: request, from: filedata) { (data, response, error) in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: response, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        }
        task.resume();
    }
    /**
     * delet file
     */
    class func deletFile(urlString:String,_ mathFunction: @escaping zymathFuncation){
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
     * delete More file
     */
    class func deleteMoreFile(urlString:String,fileDic:Dictionary<String,Array<String>> ,_ mathFunction: @escaping zymathFuncation){
        let session = URLSession.shared;
        let url = URL(string: urlString);
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request = BmobRequestConfig.setRequestHeader(request: request);
        let jsonData = try?JSONSerialization.data(withJSONObject: fileDic, options: JSONSerialization.WritingOptions.prettyPrinted);
        request.httpBody = jsonData! as Data;
        
        let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
            
            let bmconfig = BmobRequestConfig().requestTask(data: data, response: respons, error: error);
            mathFunction(bmconfig.anyObject,bmconfig.isSuccess,bmconfig.zyError);
        })
        
        task.resume();
    }
    
}
