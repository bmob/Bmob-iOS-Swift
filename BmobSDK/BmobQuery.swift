//
//  BmobQuery.swift
//  Bmob
//
//  Created by ybon on 2017/6/13.
//  Copyright © 2017年 ybon. All rights reserved.
//

import UIKit
private var _tabName:String?;
private var url:String?;
class BmobQuery: NSObject {
    /**限制返回数据的个数*/
    var limit = 0;
    /**跳过指定数量的数据*/
    var skip = 0;
    
    /**
     * 创建BmobQuery对象
     */
    class func queryWithTabName(tabName:String) -> BmobQuery?{
    
        if tabName == "" {
            print("表名为空");
            return nil;
        }
        _tabName = tabName;
        url = BmobQueryUrl + _tabName!;
        return BmobQuery.init();
    }
    /**
     * 添加一条数据
     */
    func addOneData(dataDic:Dictionary<String,Any>,_ mathFunction: @escaping zymathFuncation){
       
       
        BmobRequestWork.zyRowPOSTwithURLSession(url!, parmas: dataDic) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
        
    }
    /**
     * 更新一条数据
     */
    func upOneData(objectId:String,dataDic:Dictionary<String,Any>,_ mathFunction: @escaping zymathFuncation){
        if objectId == "" {
            mathFunction("ObjectId为空" as AnyObject,false,nil);
            return;
        }
        let urlStr = url! + "/" + objectId;
        BmobRequestWork.zyUpwithURLSession(urlStr, parmas: dataDic) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
       
    }
    /**
     * 删除一条数据
     */
    func deleteOneData(objectId:String,_ mathFunction: @escaping zymathFuncation){
        
        if objectId == "" {
            mathFunction("objectId为空" as AnyObject,false,nil);
            return;
        }
        let urlStr = url! + "/" + objectId;
        BmobRequestWork.zyDeletewithURLSession(urlStr) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
      
    }
    /**
     * 查询单条数据
     * objectId 数据对应ID
     */
    func searchOneData(objectId:String,_ mathFunction: @escaping zymathFuncation){
        
        if objectId == "" {
            mathFunction("objectId为空" as AnyObject,false,nil);
            return;
        }
        let urlStr = url! + "/" + objectId;
        BmobRequestWork.zyGETWithURLSession(urlStr, parmas: NSDictionary.init()) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
       
    }
    /**
     * 查询全部数据没有查询条件
     */
    func searchAllData(_ mathFunction: @escaping zymathFuncation){
       
        var dataDic = Dictionary<String,Any>.init();
        if limit > 0 {
            dataDic["limit"] = "\(limit)";
        }
        if skip > 0 {
            dataDic["skip"] = "\(skip)";
        }
        BmobRequestWork.zyGETWithURLSession(url!, parmas: dataDic as NSDictionary) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
 
        
    }
    /**
     * 条件查询
     * 可多条件
     * 全部放入searchDic中
     */
    func searchDataWithWhere(searchDic:Dictionary<String,Any>,_ mathFunction: @escaping zymathFuncation){
      
        let jsonData = try?JSONSerialization.data(withJSONObject: searchDic, options: JSONSerialization.WritingOptions.prettyPrinted);
        let str = String.init(data: jsonData!, encoding: String.Encoding.utf8) ;
        
        var dataDic = Dictionary<String,Any>.init();
        if (str != nil) {
            dataDic["where"] = str;
        }
        
        if limit > 0 {
            dataDic["limit"] = "\(limit)";
        }
        if skip > 0 {
            dataDic["skip"] = "\(skip)";
        }
        
        BmobRequestWork.zyGETWithURLSession(url!, parmas: dataDic as NSDictionary) { (anyObject, isSuccess, zyError) in
            
            mathFunction(anyObject,isSuccess,zyError);
        }
    }

    
    
}
