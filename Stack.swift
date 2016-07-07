//
//  Stack.swift
//  Journal
//
//  Created by Jeff Norton on 7/6/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    
    // MARK: - Stored Properties
    
    static let sharedStack = Stack()
    
    lazy var managedObjectContext: NSManagedObjectContext = Stack.setUpMainContext()
    
    // MARK: - Methods
    
    static func setUpMainContext() -> NSManagedObjectContext {
        
        let bundle = NSBundle.mainBundle()
        guard let model = NSManagedObjectModel.mergedModelFromBundles([bundle])
            else { fatalError("model not found") }
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL(), options: nil)
        let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        return context
        
    }
    
    static func storeURL() -> NSURL? {
        
        let documentsDirectory: NSURL? = try? NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true)
        
        return documentsDirectory?.URLByAppendingPathComponent("db.sqlite")
        
    }
    
}