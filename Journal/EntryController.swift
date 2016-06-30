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
    
    private let entriesKey = "entriesKey"
    
    // MARK: - Initializers
    
    init() {
        
        loadFromPersistentStore()
        
    }
    
    // MARK: - Methods
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        saveToPersistentStore()
    }
    
    func updateEntry(entry: Entry, title: String, text: String) {
        
        if let index = entries.indexOf(entry) {
         
            entries[index].title = title
            entries[index].text = text
            entries[index].timestamp = NSDate()
            
        }
        
        saveToPersistentStore()
    }
    
    func removeEntry(entry: Entry) {
        
        if let index = entries.indexOf(entry) {
            
            entries.removeAtIndex(index)
            
        }
        
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        
        NSUserDefaults.standardUserDefaults().setObject(entries.map{ $0.dictionaryCopy }, forKey: entriesKey)
        
    }
    
    func loadFromPersistentStore() {
        
        guard let entriesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [[String : AnyObject]] else {
            return
        }
        
        entries = entriesDictionaryArray.flatMap{ Entry(dictionary: $0) }
    }
}