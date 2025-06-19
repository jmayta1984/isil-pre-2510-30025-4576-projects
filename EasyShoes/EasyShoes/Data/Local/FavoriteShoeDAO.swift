//
//  FavoriteShoeDAO.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import CoreData

class FavoriteShoeDAO {
    let context = PersistenceController.shared.container.viewContext
    
    func insertFavorite(favorite: FavoriteShoe) {
        let entity = FavoriteShoeEntity(context: context)
        entity.fromDomain(favorite: favorite)
        saveContext()
    }
    
    func deleteFavorite(id: Int){
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
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
    
    func fetchAllFavorites() -> [FavoriteShoe] {
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
        
        
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.toDomain() }
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
