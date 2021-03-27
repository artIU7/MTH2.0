//
//  ViewController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit
import Foundation
import SnapKit

class WelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configLayout()
        print("Start first controller")
        // Do any additional setup after loading the view.
    }
    func configLayout() {
        view.backgroundColor = #colorLiteral(red: 0.7590399673, green: 0.7374965167, blue: 0.5871765646, alpha: 1)
        // заголовок экрана приветсвия
        let titleScreen = UILabel()
        titleScreen.font = UIFont.systemFont(ofSize: 30)
        titleScreen.numberOfLines = 0
        titleScreen.text = "Добро пожаловать в Audio Guide 🎑"
        //
        view.addSubview(titleScreen)
        titleScreen.snp.makeConstraints { (marker) in
            marker.left.right.equalToSuperview().inset(30)
            marker.top.equalToSuperview().inset(80)
        }
        // button continie
        let startTour = UIButton(type: .system)
        startTour.backgroundColor = #colorLiteral(red: 0.3759136491, green: 0.6231091984, blue: 0.6783652551, alpha: 1)
        startTour.setTitle("Посмотреть туры", for: .normal)
        startTour.setTitleColor(.white, for: .normal)
        startTour.layer.cornerRadius = 15

        view.addSubview(startTour)
        startTour.snp.makeConstraints { (marker) in
            marker.bottom.equalToSuperview().inset(20)
            marker.centerX.equalToSuperview()
            marker.width.equalTo(200)
            marker.height.equalTo(40)
        }
        startTour.addTarget(self, action: #selector(viewTours), for: .touchUpInside)
        // page controll
        let pageControl = UIPageControl()
            pageControl.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
            pageControl.numberOfPages = 2;
            pageControl.currentPage = 0;
            view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (marker) in
            marker.bottom.equalTo(startTour).inset(40)
            marker.left.right.equalToSuperview().inset(30)
        }
    }
}
//
extension WelcomeController {
    @objc func viewTours() {
        let viewTours = RouteMapsViewController()
        //startTest.modalTransitionStyle = .flipHorizontal
        viewTours.modalPresentationStyle = .fullScreen
        viewTours.modalTransitionStyle = .crossDissolve
        show(viewTours, sender: self)
        //present(startTest, animated: true, completion: nil)
        print("Launch second controller")
    }
}

