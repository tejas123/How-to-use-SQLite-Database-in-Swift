//
//  InsertRecordViewController.swift
//  DbDemoExampleSwift
//
//  Created by TheAppGuruz-New-6 on 11/08/15.
//  Copyright (c) 2015 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class InsertRecordViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    
    var isEdit : Bool = false
    var studentData : StudentInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isEdit)
        {
            txtName.text = studentData.Name;
            txtMarks.text = studentData.Marks;
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIButton Action methods
    
    @IBAction func btnBackClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnSaveClicked(sender: AnyObject)
    {
        if(txtName.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter student name.", delegate: nil)
        }
        else if(txtMarks.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter student marks.", delegate: nil)
        }
        else
        {
            if(isEdit)
            {
                let studentInfo: StudentInfo = StudentInfo()
                studentInfo.RollNo = studentData.RollNo
                studentInfo.Name = txtName.text!
                studentInfo.Marks = txtMarks.text!
                let isUpdated = ModelManager.getInstance().updateStudentData(studentInfo)
                if isUpdated {
                    Util.invokeAlertMethod("", strBody: "Record updated successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in updating record.", delegate: nil)
                }
            }
            else
            {
                let studentInfo: StudentInfo = StudentInfo()
                studentInfo.Name = txtName.text!
                studentInfo.Marks = txtMarks.text!
                let isInserted = ModelManager.getInstance().addStudentData(studentInfo)
                if isInserted {
                    Util.invokeAlertMethod("", strBody: "Record Inserted successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in inserting record.", delegate: nil)
                }
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
