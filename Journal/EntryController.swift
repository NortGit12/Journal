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
    
    // MARK: - CRUD
    /*
     * Only the creation is needed, since Playlists contain the songs.  If a song is
     * removed from the Playlist, the Song instance will get deallocated.
     */
    
    static func createEntry(title: String, text: String, journal: Journal) {
        let entry = Entry(title: title, text: text)
        JournalController.sharedController.addEntryToJournal(entry, journal: journal)
    }
    
}