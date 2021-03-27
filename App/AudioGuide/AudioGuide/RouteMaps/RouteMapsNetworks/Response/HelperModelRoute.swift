//
//  File.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation

struct routePoint {
    var uuid = ""
    var nameRoute = ""
    var distance = 0.0
    var duration = 0.0
    var orderPoint = [""]
    init() {
        
    }
    init(uuid: String,nameRoute : String,distance: Double,duration : Double, orderPoint : [String] ) {
        self.init()
        self.uuid = uuid
        self.nameRoute = nameRoute
        self.distance = distance
        self.duration = duration
        self.orderPoint = orderPoint
    }
}

struct referncePoint {
    var uuidProvider = ""
    var uuidAudio = ""
    var uuidImage = ""
    var namePoint = ""
    var lat = 0.0
    var lon = 0.0
    var parentUUID = ""
    var order = 0
    init() {
        
    }
    init(uuidProvider : String,uuidAudio : String,uuidImage : String,namePoint : String,lat : Double,lon : Double,parentUUID : String, order : Int) {
        self.uuidProvider = uuidProvider
        self.uuidAudio = uuidAudio
        self.uuidImage = uuidImage
        self.namePoint = namePoint
        self.lat = lat
        self.lon = lon
        self.parentUUID = parentUUID
        self.order = order
    }
}


