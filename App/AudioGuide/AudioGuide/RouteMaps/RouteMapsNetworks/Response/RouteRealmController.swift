//
//  RouteRealmController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation
import RealmSwift

class RealmService {
    
    private init() {}
    static let shared = RealmService()
    let realm = try! Realm()
    
    func insertObject<T : Object>(_ object : T) {
        try! realm.write {
            realm.add(object)
        }
    }
}
