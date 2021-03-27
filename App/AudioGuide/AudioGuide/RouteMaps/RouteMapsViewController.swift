//
//  RouteMapsViewController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit
import NMAKit

class RouteMapsViewController: UIViewController {
    let mapView = NMAMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        // Do any additional setup after loading the view.
    }
    func loadMap() {
        view.addSubview(mapView)
    }
    func configMap() {
        mapView.set(geoCenter: NMAGeoCoordinates(latitude: 55.716908, longitude: 37.562283), animation: .linear)
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
