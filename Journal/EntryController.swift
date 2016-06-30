//
//  EntryController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - Properties
    static let sharedController = EntryController()
    var entries: [Entry] = []
    
    // MARK: - Methods
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func updateEntry(entry: Entry, title: String, text: String) {
        
        if let index = entries.indexOf(entry) {
         
            entries[index].title = title
            entries[index].text = text
            entries[index].timestamp = NSDate()
            
        }
    }
    
    
    func removeEntry(entry: Entry) {
        
        if let index = entries.indexOf(entry) {
            
            entries.removeAtIndex(index)
            
        }
    }
}