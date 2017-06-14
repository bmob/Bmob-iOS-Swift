//
//  BmobUser.swift
//  Bmob
//
//  Created by ybon on 2017/6/13.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

class BmobUser: NSObject {

   
    private var UserInfo = Dictionary<String,Any>();
    //设置用户名
    func setName(userName:String){
        
        UserInfo["username"] = userName;
    }
    //设置密码
    func setPassWord(password:String){
        UserInfo["password"] = password;
    }
    //设置其它属性
    func setUserInfo(value:Any,key:String){
        UserInfo[key] = value;
    }
    /**
     * 注册用户
     */
    func register(_ mathFunction: @escaping zymathFuncation){
        
        if UserInfo["username"] == nil || UserInfo["password"] == nil {
            mathFunction("用户名或密码缺失" as AnyObject,false,nil);
            return;
        }
        let url = BmobUserUrl + "users";
        BmobRequestWork.zyRowPOSTwithURLSession(url, parmas: UserInfo) { (anyObject, isSuccess, zyError) in
            mathFunction(anyObject,isSuccess,zyError);
        }
   
    }
    
    /**
     * 登录用户
     */
    func login(username:String,password:String,_ mathFunction: @escaping zymathFuncation){
        if username == "" || password == "" {
            mathFunction("用户名或密码缺失" as AnyObject,false,nil);
            return;
        }
        let url = BmobUserUrl + "login"
        BmobRequestWork.zyGETWithURLSession(url, parmas: ["username":username,"password":password]) { (anyObject, isSuccess, zyError) in
            if isSuccess{
                
                BmobSDK.shareBmobSDK().currentUserID = anyObject["objectId"] as? String;
                BmobSDK.shareBmobSDK().sessionToken = anyObject["sessionToken"] as? String;
            }
            mathFunction(anyObject,isSuccess,zyError);
        }
    }
    /**
     * 获取当前用户信息
     */
    func currentUser(_ mathFunction: @escaping zymathFuncation){
        if BmobSDK.shareBmobSDK().currentUserID == nil {
            mathFunction("未登录" as AnyObject,false,nil);
            return ;
        }
        let url = BmobUserUrl + "users/" + BmobSDK.shareBmobSDK().currentUserID!;
        BmobRequestWork.zyGETWithURLSession(url, parmas: NSDictionary()) { (anyObject, isSuccess, zyError) in
          
            mathFunction(anyObject,isSuccess,zyError);
        }
    }
    /**
     * 更新当前用户信息
     */
    func upDateUesrInfo(dataDic:Dictionary<String,Any>,_ mathFunction: @escaping zymathFuncation){
        
        let url = BmobUserUrl + "users/" + BmobSDK.shareBmobSDK().currentUserID!;
        BmobRequestWork.zyUpwithURLSession(url, parmas: dataDic) { (anyObject, isSuccess, zyError) in
            mathFunction(anyObject,isSuccess,zyError);
        }
    }
    /**
     * 查询所有用户
     * searchDic 查询的限制
     * 如["limit":"12","skip":"10"]设置返回数据个数和跳过多少条数据
     */
    func searchAllUser(searchDic:Dictionary<String,String>,_ mathFunction: @escaping zymathFuncation){
        let url = BmobUserUrl + "users" ;
        BmobRequestWork.zyGETWithURLSession(url, parmas: searchDic as NSDictionary) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
    }
    /**
     * 修改密码
     * 新老密码方式修改
     */
    func updatePassword(oldPassword:String,newPassword:String,_ mathFunction: @escaping zymathFuncation){
        
        if oldPassword == "" || newPassword == "" || oldPassword == newPassword{
            mathFunction("密码内容有误" as AnyObject,false,nil);
            return;
        }
        let url = BmobUserUrl + "updateUserPassword/" + BmobSDK.shareBmobSDK().currentUserID!;
        
       BmobRequestWork.zyUpwithURLSession(url, parmas:["oldPassword":oldPassword,"newPassword":newPassword]) { (anyObject, isSuccess, zyError) in
         mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    
}
