//
//  RouteModel.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation
import RealmSwift

class RouteModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var nameRoute = ""
    convenience init(id : String,nameRoute : String) {
        self.init()
        self.id = id
        self.nameRoute = nameRoute
    }
  }
