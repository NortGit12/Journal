//
//  Entry.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    var text: String
    var timestamp: NSDate
    
    init(title: String, text: String, timestamp: NSDate) {
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {

    return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
    
}