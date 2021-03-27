//
//  Pointreference.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 28.03.2021.
//

import Foundation
import RealmSwift

class PointRefModel: Object {
    @objc dynamic var uuid = ""
    @objc dynamic var nameRoute = ""
    @objc dynamic var distance = 0.0
    @objc dynamic var duration = 0.0


  //  @objc dynamic var category = ""
  //  @objc dynamic var distance = ""
  //  @objc dynamic var duration = ""
    convenience init(uuid : String,nameRoute : String,distance : Double,duration : Double) {
        self.init()
        self.uuid = uuid
        self.nameRoute = nameRoute
        self.distance = distance
        self.duration = duration
    }
  }
