//
//  FavoriteShoeDAO.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import CoreData

class FavoriteProductDAO {
    
    static let shared = FavoriteProductDAO()
    
    private init(){}
    
    let context = PersistenceController.shared.container.viewContext
    
    func insertFavorite(favorite: FavoriteProduct) {
        let entity = FavoriteProductEntity(context: context)
        entity.fromDomain(favorite: favorite)
        saveContext()
    }
    
    func deleteFavorite(id: Int){
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAllFavorites() -> [FavoriteProduct] {
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.toDomain() }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        let request: NSFetchRequest<FavoriteProductEntity>
        request = FavoriteProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            return !entities.isEmpty
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
