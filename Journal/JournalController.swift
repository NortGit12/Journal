//
//  JournalController.swift
//  Journal
//
//  Created by Jeff Norton on 6/30/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class JournalController {
    
    // MARK: - Properties
    static let sharedController = JournalController()
    
    var journals: [Journal] = []
    
    private let storedJournalKey = "storedJournalKey"
    
    
    // MARK: - Initializers
    
    init() {
        
        // This method will execute when the instance is created, which is PlaylistTableViewController.numberOfRowsInSection
        loadFromPersistentStore()
    }
    
    
    // MARK: - CRUD
    
    func addJournal(journal: Journal) {
        journals.append(journal)
        
        saveToPersistentStore()
    }
    
    func deleteJournal(journal: Journal) {
        
        guard let index = journals.indexOf(journal) else {
            return
        }
        
        journals.removeAtIndex(index)
        
        saveToPersistentStore()
    }
    
    func addEntryToJournal(entry: Entry, journal: Journal) {
        journal.entries.append(entry)
        
        saveToPersistentStore()
    }
    
    func updateEntryInJournal(entry: Entry, title: String, text: String, journal: Journal) {
        
        guard let index = journal.entries.indexOf(entry) else {
            return
        }
        
        journal.entries[index].title = title
        journal.entries[index].text = text
        journal.entries[index].timestamp = NSDate()
        
        saveToPersistentStore()
    }
    
    func removeEntryFromJournal(entry: Entry, journal: Journal) {
        
        guard let index = journal.entries.indexOf(entry)  else {
            return
        }
        
        journal.entries.removeAtIndex(index)
        
        saveToPersistentStore()
    }
    
    // MARK: - Persistence Methods
    
    func saveToPersistentStore() {
        
        NSUserDefaults.standardUserDefaults().setObject(journals.map{ $0.dictionaryCopy }, forKey: storedJournalKey)
        
    }
    
    
    func loadFromPersistentStore() {
        
        guard let journalDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(storedJournalKey) as? [[String : AnyObject]] else {
            return
        }
        
        journals = journalDictionaryArray.flatMap{ Journal(dictionary: $0) }
        
    }
    
}