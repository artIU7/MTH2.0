//
//  RouteDetailViewController.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit

protocol RouteDetailDisplayLogic: AnyObject {

}

final class RouteDetailViewController: UIViewController {
  
  // MARK: - Public Properties

  var interactor: RouteDetailBusinessLogic?
  var router: (RouteDetailRoutingLogic & RouteDetailDataPassing)?
  

  // MARK: - Private Properties

  //

  // MARK: - Lifecycle

  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  private func configure() {
    
  }
  
  // MARK: - UI Actions
  
  //
}

// MARK: - Display Logic

extension RouteDetailViewController: RouteDetailDisplayLogic {

}
