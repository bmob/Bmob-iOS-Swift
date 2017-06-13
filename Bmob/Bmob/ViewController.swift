//
//  ViewController.swift
//  Bmob
//
//  Created by ybon on 2017/6/5.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
/*
        let bmobQuery = BmobQuery.queryWithTabName(tabName: "ideaBack");
        bmobQuery?.limit = 1;
        bmobQuery?.searchDataWithWhere(searchDic: ["send_id":"110"], mathFunction: { (anyObject, isSuccess, zyError) in
            print(anyObject,isSuccess,zyError);
        })
 
         let bmobQuery = BmobQuery.queryWithTabName(tabName: "ideaBack");
         
         bmobQuery?.upOneData(objectId: "22ff7071bf", dataDic: ["message":"yyyysssss"], mathFunction: { (anyObject, isSuccess, zyError) in
         
         print(anyObject,isSuccess,zyError,"dddd");
         })
        let bmUser = BmobUser.init();
        bmUser.setName(userName: "qingluans");
        bmUser.setPassWord(password: "1234");
        bmUser.setUserInfo(value: "23", key: "age");
        bmUser.register { (anyObject, isSuccess, zyError) in
            
           print(anyObject,isSuccess,zyError);
        }
         bmUser.currentUser { (anyObject, isSuccess, zyError) in
         print(anyObject,isSuccess,zyError,"dddd");
         }
         bmUser.upDateUesrInfo(dataDic: ["age":"124"], mathFunction: { (anyObject, isSuccess, zyError) in
         print(anyObject,isSuccess,zyError,"dddd");
         })
         
         bmUser.searchAllUser(searchDic:["limit":"5"]) { (anyObject, isSuccess, zyError) in
         
         print(anyObject,isSuccess,zyError);
         }
         bmUser.updatePassword(oldPassword: "123456", newPassword: "1234", mathFunction: { (anyObject, isSuccess, zyError) in
         
         print(anyObject,isSuccess,zyError);
         })
         
 */
        let bmUser = BmobUser();
        bmUser.login(username: "qingluans", password: "123456") { (anyObject, isSuccess, zyError) in
           
            

        }
        
        
        
        
    }


}

