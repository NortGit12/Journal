//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

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
        return EntryController.sharedController.entries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryListCell", forIndexPath: indexPath)

        let entry = EntryController.sharedController.entries[indexPath.row]
            
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = "Time: \(entry.timestamp)"

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            let entry = EntryController.sharedController.entries[indexPath.row]
            EntryController.sharedController.removeEntry(entry)
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // How am I getting there?
        if segue.identifier == "newEntryDetailSegue" {
            
            // Just go there
            
        } else if segue.identifier == "existingEntryDetailSegue" {
            
            // Where am I going?
            if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                
                // What am I packing?
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    let entry = EntryController.sharedController.entries[index]
                    
                    // Did I/it get there?
                    entryDetailViewController.existingEntry = entry
                    entryDetailViewController.title = entry.title
                }
            }
        }
    }
    

}
