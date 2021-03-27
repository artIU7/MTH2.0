//
//  RouteMapsFetch.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation


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
                        for child in children {
                            uuid = child["uuid"] as! String
                            print(uuid)
                        }
                    }
                    print(title)
                    //print(content)
                    print(duration)
                    print(category)
                    print(type)
                    print(distance)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
   
func FetchChild () {
    let urlString = "https://api.izi.travel/mtgobjects/62497048-5472-4d9a-9599-472e3b3ab009?languages=ru,en&includes=all&except=translations,publisher,download&api_key=7c6c2db9-d237-4411-aa0e-f89125312494"
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
        //print(preload)
        print("json response decoder")
        for child in preload {
            let content_provider = child["content_provider"] as! [String:Any]
            
            let uuid = content_provider["uuid"] as! String
            let name = content_provider["name"] as! String
            let location = child["location"] as!  [String:Any]
            let content = child["content"] as! [[String:Any]]
            for child_content in content {
                //print(child_content)
                let audio = child_content["audio"] as! [[String:Any]]
                for element in audio {
                    let uuid = element["uuid"] as! String
                    print(uuid
                    )
                }
                let images = child_content["images"] as! [[String:Any]]
                print(audio)
                //print(images)
            }
            print(uuid)
        print(name)
            }
  
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
