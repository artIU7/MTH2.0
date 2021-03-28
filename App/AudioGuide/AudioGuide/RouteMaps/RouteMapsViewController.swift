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

var tempPosition : CLLocationCoordinate2D!

class RouteMapsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var itemsToLoad = [String]()
    let mapView = NMAMapView()
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playButton:UIButton?
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIMap()
        loadUISceneKit()
        //
        configMap()
        //  режим кастомизации карты (настройки пользователя)
        custumisationMap(type: true)
        //
        let realms = RealmService.shared.realm
        //
        // грузим json
        FetchRoute()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [self] in
            getUUID()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(1.5))) { [self] in
            showUUID()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(2.5))) { [self] in
            loadRouteRef()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(2.5))) { [self] in
                        var refRoute = try! Realm().objects(PointRefModel.self)
                        print("Ref :: \(refRoute)")
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.initLocationManager()
                self.startLocation()
            }
        }

        //initrealm()
     

        //FetchAudio()
        //playAudio()
        //playSound(soundUrl: "https://media.izi.travel/3f41a4ab-3836-4daa-b5cb-b20a8f8235b5/ae9d8aef-8d13-416a-97a7-e6f63887061f.m4a?api_key=7c6c2db9-d237-4411-aa0e-f89125312494")
        // Do any additional setup after loading the view.
    }
    func getUUID() {
        for element in fetcStructure {
            let arrayReference = element.orderPoint
            for i in 0 ... arrayReference.count - 1 {
                FetchChild(uuuidPoint: arrayReference[i], index: i)
            }
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

                } else {
                    player!.pause()
                    //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
                    playButton!.setTitle("Play", for: UIControl.State.normal)
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
        let subView = UIView()
        let tableViewRoute = UITableView()
        tableViewRoute.dataSource = self
        tableViewRoute.delegate = self
        tableViewRoute.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        subView.addSubview(tableViewRoute)
        subView.backgroundColor = #colorLiteral(red: 0.5482032924, green: 0.8896667527, blue: 0.9267322501, alpha: 0.8)
        subView.layer.cornerRadius = 15
        tableViewRoute.snp.makeConstraints { (marker) in
            marker.height.equalTo(subView.frame.height)
            marker.width.equalTo(subView.frame.height)
            marker.bottom.top.equalToSuperview().inset(0)
        }
        view.addSubview(subView)
        subView.snp.makeConstraints { (marker) in
            marker.height.equalTo(view.frame.height/3)
            marker.width.equalTo(view.frame.width)
            marker.bottom.equalToSuperview().inset(-10)
            
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
        self.mapView.set(geoCenter: NMAGeoCoordinates(latitude: 55.716908, longitude: 37.562283), animation: .linear)
        self.mapView.positionIndicator.isVisible = true
        self.mapView.positionIndicator.tracksCourse = true
        let accuracyColor = #colorLiteral(red: 0.4004088239, green: 0.9419217957, blue: 0.8626950897, alpha: 0.4428563784)
        self.mapView.positionIndicator.isAccuracyIndicatorVisible = false
        self.mapView.positionIndicator.accuracyIndicatorColor = accuracyColor
    }
    func initrealm() {
        var dataRoute = try! Realm().objects(RouteModel.self)
        print("data route \(dataRoute)")
        if dataRoute.isEmpty  {
        //FetchRoute()
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
        for i in 0 ... fetchReference.count - 1 {
                let ref = PointRefModel(uuidProvider: fetchReference[i].uuidProvider, uuidAudio: fetchReference[i].uuidAudio, uuidImage: fetchReference[i].uuidImage, namePoint: fetchReference[i].namePoint, lat: fetchReference[i].lat, lon: fetchReference[i].lon, parentUUID: fetchReference[i].parentUUID, order: fetchReference [i].order)
                    RealmService.shared.insertObject(ref)
            }
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
extension RouteMapsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
             
             cell.textLabel?.text = self.itemsToLoad[indexPath.row]
             
             return cell
    }
}

extension RouteMapsViewController : NMAMapGestureDelegate,NMAMapViewDelegate {}
extension RouteMapsViewController : CLLocationManagerDelegate {}
