//
//  RouteMapsViewController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit
import NMAKit
import RealmSwift
import AVFoundation

let realms = RealmService.shared.realm

class RouteMapsViewController: UIViewController {
    let mapView = NMAMapView()
    var player:AVPlayer?
    var playerItem:AVPlayerItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIMap()
        loadUISceneKit()
        //  режим кастомизации карты (настройки пользователя)
        custumisationMap(type: true)
        //
        //initrealm()
        // грузим json
        //FetchRoute()
        FetchChild()
        player!.play()
        //FetchAudio()
        //playAudio()
        //playSound(soundUrl: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
           let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
           player = AVPlayer(playerItem: playerItem)
           
           let playerLayer=AVPlayerLayer(player: player!)
           playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
           self.view.layer.addSublayer(playerLayer)
       }
    // добавляем карту на вьюху
    func loadUIMap() {
        view.addSubview(mapView)
        self.mapView.snp.makeConstraints { (marker) in
            marker.top.equalTo(self.view).inset(0)
            marker.left.right.equalTo(self.view).inset(0)
            marker.bottom.equalTo(self.view).inset(0)
        }
    }
    func custumisationMap( type : Bool ) {
        if (type) {
            mapView.positionIndicator.isVisible = true
            mapView.mapScheme = NMAMapSchemeNormalNight
        } else {
            mapView.positionIndicator.isVisible = true
            mapView.mapScheme = NMAMapSchemeNormalNight
        }
    }
    func configMap() {
        mapView.set(geoCenter: NMAGeoCoordinates(latitude: 55.716908, longitude: 37.562283), animation: .linear)
    }
    func initrealm() {
        var routes = try! Realm().objects(RouteModel.self)
        if routes.isEmpty {
            routes.map({
                RealmService.shared.insertObject($0)
        })
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /*func playAudio()
    {

            // set URL of the sound
            let soundURL = URL(string: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
            
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
                
                // check if audioPlayer is prepared to play audio
                if (audioPlayer!.prepareToPlay())
                {
                    audioPlayer!.play()
                }
            }
            catch
            { print("error") }
    }*/
    //func playSound(soundUrl: String) {
   //     let sound = URL(fileURLWithPath: soundUrl)
   //     do {
    //        let audioPlayer = try AVAudioPlayer(//(contentsOf: sound)
    //        audioPlayer.prepareToPlay()
    //        audioPlayer.play()
    //    }catch let error {
    //        print("Error: \(error.localizedDescription)")
    //    }
  //  }
}
