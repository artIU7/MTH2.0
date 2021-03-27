//
//  RouteDetailRouter.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit

protocol RouteDetailRoutingLogic {

}

protocol RouteDetailDataPassing {
  var dataStore: RouteDetailDataStore? { get }
}

final class RouteDetailRouter: RouteDetailRoutingLogic, RouteDetailDataPassing {

  // MARK: - Public Properties

  weak var parentController: UIViewController?
  weak var viewController: RouteDetailViewController?
  var dataStore: RouteDetailDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
