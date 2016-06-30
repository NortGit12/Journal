//
//  Journal.swift
//  Journal
//
//  Created by Jeff Norton on 6/30/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class Journal: Equatable {
    
    // MARK: - Properties
    var name: String
    var entries: [Entry] = []
    
    private let nameKey = "nameKey"
    private let entriesKey = "entriesKey"
    
    var dictionaryCopy: [String : AnyObject] {
        
        return [nameKey: name, entriesKey: entries.map{ $0.dictionaryCopy }]
        
    }
    
    // MARK: - Initializers
    
    init(name: String, entries: [Entry] = []) {
        self.name = name
        self.entries = entries
    }
    
    init?(dictionary: [String : AnyObject]) {
        
        guard let name = dictionary[nameKey] as? String, let entriesDictionaryArray = dictionary[entriesKey] as? [[String : AnyObject]] else {
            return nil
        }
        
        let entries = entriesDictionaryArray.flatMap{ Entry(dictionary: $0) }
        
        self.name = name
        self.entries = entries
    }
    
}

func ==(lhs: Journal, rhs: Journal) -> Bool {

    return lhs.name == rhs.name && lhs.entries == rhs.entries

}