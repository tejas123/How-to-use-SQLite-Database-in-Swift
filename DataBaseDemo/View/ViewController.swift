//
//  ViewController.swift
//  DataBaseDemo
//
//  Created by Krupa-iMac on 05/08/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtRollNo: UITextField!
    @IBOutlet var txtName: UITextField!    
    
    //View LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Action Method
    @IBAction func btnInsertClicked(sender: AnyObject) {
        var studentInfo: StudentInfo = StudentInfo()
        studentInfo.studentRollNo = txtRollNo.text
        studentInfo.studentName = txtName.text
        
        var isInserted = ModelManager.instance.addStudentData(studentInfo)
        if isInserted {
            Util.invokeAlertMethod("", strBody: "Record Inserted successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in inserting record.", delegate: nil)
        }
        txtRollNo.text = ""
        txtName.text = ""
        txtRollNo.becomeFirstResponder()
    }
    
    @IBAction func btnUpdateClicked(sender: AnyObject) {
        var studentInfo: StudentInfo = StudentInfo()
        studentInfo.studentRollNo = txtRollNo.text
        studentInfo.studentName = txtName.text
        
        var isUpdated = ModelManager.instance.updateStudentData(studentInfo)
        if isUpdated {
            Util.invokeAlertMethod("", strBody: "Record updated successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in updating record.", delegate: nil)
        }
        txtRollNo.text = ""
        txtName.text = ""
        txtRollNo.becomeFirstResponder()
    }
    
    @IBAction func btnDeleteClicked(sender: AnyObject) {
        var studentInfo: StudentInfo = StudentInfo()
        studentInfo.studentRollNo = txtRollNo.text
        studentInfo.studentName = txtName.text
        
        var isDeleted = ModelManager.instance.deleteStudentData(studentInfo)
        if isDeleted {
            Util.invokeAlertMethod("", strBody: "Record deleted successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in deleting record.", delegate: nil)
        }
        txtRollNo.text = ""
        txtName.text = ""
        txtRollNo.becomeFirstResponder()
    }
    
    @IBAction func btnDisplayRecordClicked(sender: AnyObject) {
        println("All student data :")
        ModelManager.instance.getAllStudentData()
    }
    
    //Memory Warning Method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

