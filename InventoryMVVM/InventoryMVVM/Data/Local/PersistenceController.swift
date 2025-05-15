//
//  PersistenceController.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/14/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "InventoryMVVMModel")
        
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError(error.localizedDescription)
            }
        }
    }
}
