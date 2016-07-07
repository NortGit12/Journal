//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var journal: Journal?
    
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
        
        guard let journal = journal else {
            return 0
        }
        
        return journal.entries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryListCell", forIndexPath: indexPath)

        let entry = EntryController.sharedController.entries[indexPath.row]
        
        guard let timestamp = entry.timestamp else { return UITableViewCell() }
        
        cell.textLabel?.text = entry.title
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        
        let dateString = formatter.stringFromDate(timestamp)
        
        cell.detailTextLabel?.text = "\tTime: \(dateString)"
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            if let journal = journal {
                
//                let entry = journal.entries[indexPath.row]
//                JournalController.sharedController.removeEntryFromJournal(entry, journal: journal)
                
                let entry = EntryController.sharedController.entries[indexPath.row]
                
                EntryController.sharedController.removeEntry(entry)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // What am I packing?
        if let journal = journal {
            
            // How am I getting there?
            if segue.identifier == "newEntryDetailSegue" {
                
                // Where am I going?
                if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                    
                    // Did I/it get there?
                    entryDetailViewController.journal = journal
                }
                
            } else if segue.identifier == "existingEntryDetailSegue" {
                
                // Where am I going?
                if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                    
                    // What am I packing?
                    if let index = tableView.indexPathForSelectedRow?.row {
                        
                        let entry = journal.entries[index]
                        
                        // Did I/it get there?
                        entryDetailViewController.journal = journal
                        entryDetailViewController.entry = entry
                        entryDetailViewController.title = entry.title
                    }
                }
            }
        }
    }
    

}
