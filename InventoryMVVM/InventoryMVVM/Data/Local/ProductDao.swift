//
//  ProductDao.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/14/25.
//

import CoreData

class ProductDao {
    
    let context = PersistenceController.shared.container.viewContext
    
    
    func fetchProducts() -> [Product] {
        let request: NSFetchRequest<ProductEntity>
        
        request = ProductEntity.fetchRequest()
        
        do {
            return try context.fetch(request).map { $0.toProduct() }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func insertProduct(product: Product) {
        let entity = ProductEntity(context: context)
        entity.fromProduct(product: product)
        saveContext()
    }
    
    func deleteProduct(id: UUID) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func updateProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity>
        request = ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", product.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                entity.fromProduct(product: product)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    
    
    
    private func saveContext() {
        do {
            try  context.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
