//
//  Pointreference.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 28.03.2021.
//

import Foundation
import RealmSwift

class PointRefModel: Object {

    @objc dynamic  var uuidProvider = ""
    @objc dynamic  var uuidAudio = ""
    @objc dynamic  var uuidImage = ""
    @objc dynamic  var namePoint = ""
    @objc dynamic  var lat = 0.0
    @objc dynamic  var lon = 0.0
    @objc dynamic  var parentUUID = ""

  //  @objc dynamic var category = ""
  //  @objc dynamic var distance = ""
  //  @objc dynamic var duration = ""
    convenience init(uuidProvider : String,uuidAudio : String,uuidImage : String, namePoint : String, lat : Double, lon : Double, parentUUID : String) {
        self.init()
        self.uuidProvider = uuidProvider
        self.uuidAudio = uuidAudio
        self.uuidImage = uuidImage
        self.namePoint = namePoint
        self.lat = lat
        self.lon = lon
        self.parentUUID = parentUUID
    }
}
