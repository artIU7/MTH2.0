//
//  RouteMapsViewController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit
import NMAKit
import RealmSwift

let realms = RealmService.shared.realm

class RouteMapsViewController: UIViewController {
    let mapView = NMAMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUIMap()
        loadUISceneKit()
        //  режим кастомизации карты (настройки пользователя)
        custumisationMap(type: true)
        //
        initrealm()
        // Do any additional setup after loading the view.
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
