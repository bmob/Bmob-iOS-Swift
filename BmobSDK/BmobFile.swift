//
//  BmobFile.swift
//  BmobSDKTest
//
//  Created by ybon on 2017/6/14.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

class BmobFile: NSObject {
    
    
    
    /**
     上传图片
     */
    func upImage(image:UIImage,_ mathFunction: @escaping zymathFuncation){
        let fileName = reDate() + ".jpg";
        let url = BaseFileUrl + fileName;
        
        BmobFileRequestWork.uploadImage(url, image: image) { (anyObject, isSuccess, zyError) in
            mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    /**
     上传文件
     */
    func upFile(_ fileType:String,_ fileName:String,_ filePath:String,_ mathFunction: @escaping zymathFuncation) {
        if fileType == "" || fileName == "" || filePath == "" {
            mathFunction("参数有误" as AnyObject,false,nil);
            return;
        }
        let url = BaseFileUrl + fileName;
        BmobFileRequestWork.uploadFile(url, fileType, filePath) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    
    //返回指定格式的时间
    func reDate()-> String{
        let date = Date();
        let zone = TimeZone.init(identifier: "Asia/Shanghai");
        let formatter = DateFormatter();
        formatter.timeZone = zone ;
        formatter.dateFormat = "yyyyMMddHHmmss";
        let dateString = formatter.string(from: date);
        return dateString;
    }
    
}
