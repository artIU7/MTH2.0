//
//  RouteMapsFetch.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation

var fetcStructure = [routePoint]()
var fetchReference = [referncePoint]()

func FetchRoute() {
    let urlString = "https://api.izi.travel/mtgobjects/e2737aad-9a17-4e5a-9964-6b7de3e12105?languages=ru,en&includes=all&except=translations,publisher,download&api_key=7c6c2db9-d237-4411-aa0e-f89125312494"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data,response,error) in
            if let response = response {
                print(response)
            }
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let preload = json as! [[String:Any]]
                var orderString = [String]()
                //print(preload)
                print("json response decoder")
                for child in preload {
                    let distance = child["distance"] as! Double
                    let type = child["type"] as! String
                    let category = child["category"] as! String
                    let duration = child["duration"] as! Double
                    let content = child["content"] as! [[String:Any]]
                    var title = String()
                    var children : [[String:Any]]!
                    var routeChild : [[String:Any]]!
                    var uuid : String!
                    for contenElement in content {
                         title = contenElement["title"] as! String
                         children = contenElement["children"] as! [[String:Any]]
                        let playback = contenElement["playback"] as! [String:Any]
                       // print(playback)
                        let order = playback["order"] as! [String]
                        orderString = order
                        //print(order)
                        for child in children {
                            uuid = child["uuid"] as! String
                         //   print(uuid)
                        }
                    }
                  //  print(title)
                  //  print(distance)
                  //  print(duration)
                    fetcStructure.append(routePoint(uuid: uuid, nameRoute: title, distance: distance, duration: duration, orderPoint: orderString))
                    print(fetcStructure)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
   
func FetchChild (uuuidPoint : String) {
    let urlString = "https://api.izi.travel/mtgobjects/\(uuuidPoint)?languages=ru,en&includes=all&except=translations,publisher,download&api_key=7c6c2db9-d237-4411-aa0e-f89125312494"
//  content_provider
//       uuid
    //  name
// content
        // audio
        // images
// location
guard let url = URL(string: urlString) else {return}
let session = URLSession.shared
session.dataTask(with: url) { (data,response,error) in
    if let response = response {
        print(response)
    }
    guard let data = data else {return}
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        let preload = json as! [[String:Any]]
        var uuidAudio : String!
        var namePoint : String!
        var lat : Double!
        var lon : Double!
        var parrentUUID : String!
        var uuidImage : String!
        var uuidProvider : String!
        //print(preload)
        print("json response decoder")
        parrentUUID = uuuidPoint
        let element = preload.first
        let content_prov = element?["content_provider"] as! [String:Any]
        let uuid = content_prov["uuid"] as! String
        uuidProvider = uuid
        let name = content_prov["name"] as! String
        let location = element?["location"] as!  [String:Any]
        lat = location["latitude"] as! Double
        lon = location["longitude"] as! Double
        let content = element!["content"] as! [[String:Any]]
        let child_content = content.first
        let audio = child_content!["audio"] as! [[String:Any]]
        for element in audio {
            let uuid = element["uuid"] as! String
                uuidAudio = uuid
        }
        let images = child_content!["images"] as! [[String:Any]]
        for img in images {
            uuidImage = img["uuid"] as! String
        }
        namePoint = child_content!["title"] as! String

        print(uuidProvider)
        print(uuidAudio)
        print(uuidImage)
        print(namePoint)
        print(lat)
        print(lon)
        print(parrentUUID)
            //uuidAudio
            // parent uuidRoite
            // lat
            // lon
            // name
            // uuidImage
     
        fetchReference.append(referncePoint(uuidProvider: uuidProvider, uuidAudio: uuuidPoint, uuidImage: uuidImage, namePoint: namePoint, lat: lat, lon: lon, parentUUID: parrentUUID))
            
  
    } catch {
        print(error)
    }
}.resume()
}
func FetchAudio () {
    let urlString =
    "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/565cf3a5-4cd0-4a20-a5ea-96cbe9f8b3d3.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494"
//  content_provider
//       uuid
    //  name
// content
        // audio
        // images
// location
guard let url = URL(string: urlString) else {return}
let session = URLSession.shared
session.dataTask(with: url) { (data,response,error) in
    if let response = response {
        print(response)
    }
    guard let data = data else {return}
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
        //print(preload)
        print("json response decoder")
  
    } catch {
        print(error)
    }
}.resume()
}
