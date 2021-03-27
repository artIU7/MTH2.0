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
        let realms = RealmService.shared.realm
        //
        // грузим json
        FetchRoute()
        //initrealm()
     

        //FetchAudio()
        //playAudio()
        //playSound(soundUrl: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
        // Do any additional setup after loading the view.
    }
    func getUUID() {
        for element in fetcStructure {
            let arrayReference = element.orderPoint
            arrayReference.map({
                                FetchChild(uuuidPoint: $0)
            })
        }
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
                    getUUID()

                } else {
                    player!.pause()
                    //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
                    playButton!.setTitle("Play", for: UIControl.State.normal)
                    showUUID()
                    loadRouteRef()
                }
                print(fetchReference)
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

        var dataRoute = try! Realm().objects(RouteModel.self)
        print("data route \(dataRoute)")
        if dataRoute.isEmpty  {
            
        //FetchRoute()
        print(fetcStructure)
        fetcStructure.map({
        var routes = RouteModel(uuid: $0.uuid, nameRoute: $0.nameRoute, distance: $0.distance, duration: $0.duration)
                
                RealmService.shared.insertObject(routes)
            })
        }
        
    }
    
    func loadRouteRef() {
        var refRoute = try! Realm().objects(PointRefModel.self)
        print("data ref \(refRoute)")
        if refRoute.isEmpty  {
            
        //FetchRoute()
        print(refRoute)
        fetchReference.map({
            var ref = PointRefModel(uuidProvider: $0.uuidProvider, uuidAudio: $0.uuidAudio, uuidImage: $0.uuidImage, namePoint: $0.namePoint, lat: $0.lat, lon: $0.lon, parentUUID: $0.parentUUID)
                RealmService.shared.insertObject(ref)
            })
        }
    }
    func showUUID() {
        initrealm()
        let routesUUID = try! Realm().objects(RouteModel.self)
        print("routes :: \(routesUUID)")
        routesUUID.map ({
            print($0.nameRoute)
        }
        )
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
