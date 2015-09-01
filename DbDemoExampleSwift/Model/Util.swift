//
//  Util.swift
//  DemoProject
//
//  Created by Krupa-iMac on 24/07/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {        
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0].stringByAppendingPathComponent(fileName)
    }
    
    class func copyFile(fileName: NSString) {
        var dbPath: String = getPath(fileName as String)
        var fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(dbPath) {
            var fromPath: String? = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent(fileName as String)
            var error : NSError?
            fileManager.copyItemAtPath(fromPath!, toPath: dbPath, error: &error)
            var alert: UIAlertView = UIAlertView()
            if (error != nil) {
                alert.title = "Error Occured"
                alert.message = error?.localizedDescription
            } else {
                alert.title = "Successfully Copy"
                alert.message = "Your database copy successfully"
            }
            alert.delegate = nil
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
    class func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
        var alert: UIAlertView = UIAlertView()
        alert.message = strBody as String
        alert.title = strTitle as String
        alert.delegate = delegate
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
   
}