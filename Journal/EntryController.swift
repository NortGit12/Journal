//
//  EntryController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    // MARK: - Properties
    
    private let entriesKey = "entries"
    
    static let sharedController = EntryController()
    
    var entries: [Entry] {
        let request = NSFetchRequest(entityName: "Entry")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [Entry]
        } catch {
            return []
        }
    }
    
    // MARK: - Initializer(s)
    
    
    // MARK: - CRUD
    /*
     * Only the creation is needed, since Playlists contain the songs.  If a song is
     * removed from the Playlist, the Song instance will get deallocated.
     */
    
//    static func createEntry(title: String, text: String, journal: Journal) {
//        let entry = Entry(title: title, text: text)
//        JournalController.sharedController.addEntryToJournal(entry, journal: journal)
//    }
    
    func addEntry(entry: Entry) {
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        entry.managedObjectContext?.deleteObject(entry)
        
        self.saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStorage() {
        
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving Managed Object Context.  Item not saved.")
        }
        
    }
    
}