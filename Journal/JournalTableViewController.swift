//
//  JournalTableViewController.swift
//  Journal
//
//  Created by Jeff Norton on 6/30/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {

    // MARK: Properties
    @IBOutlet weak var journalTextField: UITextField!
    
    
    // MARK: - General
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return JournalController.sharedController.journals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("journalListCell", forIndexPath: indexPath)

        let journal = JournalController.sharedController.journals[indexPath.row]
        
        var entryCountString = ""
        
        if journal.entries.count == 1 {
            entryCountString = "entry"
        } else {
            entryCountString = "entries"
        }
        
        cell.textLabel?.text = journal.name
        cell.detailTextLabel?.text = "\(journal.entries.count) \(entryCountString)"

        return cell
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        guard let journalName = journalTextField.text where journalName.characters.count > 0 else {
            return
        }
        
        let journal = Journal(name: journalName)
        JournalController.sharedController.addJournal(journal)
        journalTextField.text = ""
        
        tableView.reloadData()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // How am I getting there?
        if segue.identifier == "toEntriesList" {
            
            // Where am I going?
            if let entryListTableViewController = segue.destinationViewController as? EntryListTableViewController {
                
                // What am I packing?
                if let index = tableView.indexPathForSelectedRow?.row {
                    let journal = JournalController.sharedController.journals[index]
                
                    // Did I pack it?
                    entryListTableViewController.journal = journal
                }
            }
            
        }
    }
}
