//
//  AgendaViewController.swift
//  Agenda
//
//  Created by Rudd Fawcett on 10/16/15.
//  Copyright © 2015 Phillips Academy Launch Pad. All rights reserved.
//

import UIKit

class AgendaViewController: UITableViewController, UIAlertViewDelegate {
    
    let kAgendaCellIdentifier = "AgendaCell"

    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add-button"),
            style: .Plain, target: self,
            action: Selector("addItem"))
        
        self.title = "Agenda"
        
        self.tableView.rowHeight = 70
        self.tableView.tableFooterView = UIView()
        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: kAgendaCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Add item logic
    
    func addItem() {
        let alert = UIAlertController(title: "Add an Item", message: "What would you like to add to your agenda?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
            let newItem : String = alert.textFields![0].text! as String
            self.items.append(newItem)
            
            self.tableView.reloadData()
        }))
            
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "Item"
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }

    // MARK - Table view delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kAgendaCellIdentifier)
        
        cell?.textLabel?.text = self.items[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFontOfSize(18)
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        
        cell?.separatorInset = UIEdgeInsetsZero;
        cell?.preservesSuperviewLayoutMargins = false
        cell?.layoutMargins = UIEdgeInsetsZero;
        
        cell?.tintColor = self.navigationController?.navigationBar.barTintColor
        
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell : UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == .Checkmark {
            cell.accessoryType = .None
            cell.textLabel?.textColor = UIColor.darkGrayColor()
            cell.backgroundColor = UIColor.whiteColor()
        }
        else {
            cell.accessoryType = .Checkmark
            cell.textLabel?.textColor = UIColor(red:0.73, green:0.75, blue:0.75, alpha:1)
            cell.backgroundColor = UIColor(red:0.94, green:0.95, blue:0.95, alpha:1)
        }
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.items.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}
