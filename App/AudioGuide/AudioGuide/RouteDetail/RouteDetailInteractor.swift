//
//  RouteDetailInteractor.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import Foundation

protocol RouteDetailBusinessLogic {

}

protocol RouteDetailDataStore {

}

final class RouteDetailInteractor: RouteDetailBusinessLogic, RouteDetailDataStore {

  // MARK: - Public Properties

  var presenter: RouteDetailPresentationLogic?
  lazy var worker: RouteDetailWorkingLogic = RouteDetailWorker()

  // MARK: - Private Properties
  
  //

  // MARK: - Business Logic
  
  //
}
