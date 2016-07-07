//
//  Entry+CoreDataProperties.swift
//  Journal
//
//  Created by Jeff Norton on 7/6/16.
//  Copyright © 2016 JCN. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var title: String?
    @NSManaged var text: String?
    @NSManaged var timestamp: NSDate?

}
