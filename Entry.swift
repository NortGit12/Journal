//
//  Entry.swift
//  Journal
//
//  Created by Jeff Norton on 7/6/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation
import CoreData

@objc(Entry)
class Entry: NSManagedObject {

    convenience init(title: String, text: String, timestamp: NSDate = NSDate(), context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Entry", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title
        self.text = text
        self.timestamp = timestamp
        
    }

}
