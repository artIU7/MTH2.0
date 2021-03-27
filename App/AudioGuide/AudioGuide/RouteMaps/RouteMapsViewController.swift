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
    var playButton:UIButton?

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

        //FetchAudio()
        //playAudio()
        //playSound(soundUrl: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           let url = URL(string: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
           let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
           player = AVPlayer(playerItem: playerItem)
           
           let playerLayer=AVPlayerLayer(player: player!)
           playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
           self.view.layer.addSublayer(playerLayer)
        playButton = UIButton(type: UIButton.ButtonType.system) as UIButton
                let xPostion:CGFloat = 50
                let yPostion:CGFloat = 100
                let buttonWidth:CGFloat = 150
                let buttonHeight:CGFloat = 45
                
                playButton!.frame = CGRect(x: xPostion, y: yPostion, width: buttonWidth, height: buttonHeight)
                playButton!.backgroundColor = UIColor.lightGray
                playButton!.setTitle("Play", for: UIControl.State.normal)
                playButton!.tintColor = UIColor.black
                playButton!.addTarget(self, action: #selector(self.playButtonTapped(_:)), for: .touchUpInside)
                
                self.view.addSubview(playButton!)
            }
            
            @objc func playButtonTapped(_ sender:UIButton)
            {
                if player?.rate == 0
                {
                    player!.play()
                    //playButton!.setImage(UIImage(named: "player_control_pause_50px.png"), forState: UIControlState.Normal)
                    playButton!.setTitle("Pause", for: UIControl.State.normal)
                } else {
                    player!.pause()
                    //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
                    playButton!.setTitle("Play", for: UIControl.State.normal)
                }
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
}
