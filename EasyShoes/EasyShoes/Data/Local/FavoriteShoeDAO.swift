//
//  FavoriteShoeDAO.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

class FavoriteShoeDAO {
    let context = PersistenceController.shared.container.viewContext
    
    func insertFavorite(favorite: FavoriteShoe) {
        let entity = FavoriteShoeEntity(context: context)
        entity.fromDomain(favorite: favorite)
        saveContext()
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
