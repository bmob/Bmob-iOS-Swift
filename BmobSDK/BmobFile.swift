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
     * 上传图片
     */
    func upImage(image:UIImage,_ mathFunction: @escaping zymathFuncation){
        let fileName = reDate() + ".jpg";
        let url = BmobFileUrl + fileName;
        
        BmobFileRequestWork.uploadImage(url, image: image) { (anyObject, isSuccess, zyError) in
            mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    /**
     * 上传文件
     * fileType 文件类型 如 image/jpeg
     * fileName 文件名 返回的cdnName名字
     * filePath 文件路径
     */
    func upFile(_ fileType:String,_ fileName:String,_ filePath:String,_ mathFunction: @escaping zymathFuncation) {
        if fileType == "" || fileName == "" || filePath == "" {
            mathFunction("参数有误" as AnyObject,false,nil);
            return;
        }
        let url = BmobFileUrl + fileName;
        BmobFileRequestWork.uploadFile(url, fileType, filePath) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    /**
     * 删除文件
     * fileUrl 是上传之后返回的url，然后去掉前面的域名
     * cdnName 是上传之后返回的名字
     */
    func deletFile(_ fileUrl:String,_ cdnName:String,mathFunction: @escaping zymathFuncation){
        if fileUrl == "" || cdnName == ""{
            mathFunction("参数有误" as AnyObject,false,nil);
            return;
        }
        let url = BmobFileUrl + cdnName + "/" + fileUrl;
       
        BmobFileRequestWork.deletFile(urlString: url) { (anyObject, isSuccess, zyError) in
            
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
