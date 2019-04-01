//
//  PlaylistRepo.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation
import CoreData

class PlaylistRepo {
    
    func getPlaylistById(id: String) -> [Song]? {
        let context = CacheDB.get().getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: EntitySong.entity.rawValue)
        var items: [Song] = []
        request.predicate = NSPredicate(format: "id = %@", id)

        do {
            let result = try context.fetch(request)
            print("IS EMPTY : \(result.isEmpty)")
            
            for data in result as! [Song] {
                items.append(data)
            }
            
            return items
        } catch {
            return nil
        }
    }
    
    func refreshById(id: String) {
        APIClient.getPlaylistByID(id: id, completion: { result in
            guard let result = result else {
                print("Something went wrong")
                return
            }
            
            let context = CacheDB.get().getContext()
            for i in result.items {
                let song = CacheDB.get().getNewEntity(context: context, entity: EntitySong.entity.rawValue)
                song.setValue(id, forKey: EntitySong.id.rawValue)
                song.setValue(i.track.name, forKey: EntitySong.title.rawValue)
                song.setValue(i.track.album.name, forKey: EntitySong.albumName.rawValue)
                song.setValue(i.track.artists[0].name, forKey: EntitySong.artistsName.rawValue)
                song.setValue(i.track.uri, forKey: EntitySong.uri.rawValue)
            }

            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
            RefreshStrategy.get().refresh(className: CDSong().className)
        })
    }
}
