//
//  HomeScreenViewController.swift
//  DbDemoExampleSwift
//
//  Created by TheAppGuruz-New-6 on 11/08/15.
//  Copyright (c) 2015 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    var marrStudentData : NSMutableArray!
    @IBOutlet weak var tbStudentData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getStudentData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Other methods
    
    func getStudentData()
    {
        marrStudentData = NSMutableArray()
        marrStudentData = ModelManager.getInstance().getAllStudentData()
        tbStudentData.reloadData()
    }
    
    //MARK: UITableView delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrStudentData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:StudentCell = tableView.dequeueReusableCellWithIdentifier("cell") as! StudentCell
        var student:StudentInfo = marrStudentData.objectAtIndex(indexPath.row) as! StudentInfo
        cell.lblContent.text = "Name : \(student.Name)  \n  Marks : \(student.Marks)"
        cell.btnDelete.tag = indexPath.row
        cell.btnEdit.tag = indexPath.row
        return cell
    }
    
    //MARK: UIButton Action methods

    @IBAction func btnDeleteClicked(sender: AnyObject) {
        var btnDelete : UIButton = sender as! UIButton
        var selectedIndex : Int = btnDelete.tag
        var studentInfo: StudentInfo = marrStudentData.objectAtIndex(selectedIndex) as! StudentInfo
        var isDeleted = ModelManager.getInstance().deleteStudentData(studentInfo)
        if isDeleted {
            Util.invokeAlertMethod("", strBody: "Record deleted successfully.", delegate: nil)
        } else {
            Util.invokeAlertMethod("", strBody: "Error in deleting record.", delegate: nil)
        }
        self.getStudentData()
    }

    @IBAction func btnEditClicked(sender: AnyObject)
    {
        self.performSegueWithIdentifier("editSegue", sender: sender)
    }
    
    //MARK: Navigation methods

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editSegue")
        {
            var btnEdit : UIButton = sender as! UIButton
            var selectedIndex : Int = btnEdit.tag
            var viewController : InsertRecordViewController = segue.destinationViewController as! InsertRecordViewController
            viewController.isEdit = true
            viewController.studentData = marrStudentData.objectAtIndex(selectedIndex) as! StudentInfo
        }
    }

}
