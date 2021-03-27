//
//  RouteDetailView.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import SnapKit
import UIKit

protocol RouteDetailViewLogic: UIView {
  
}

final class RouteDetailView: UIView {
  
  // MARK: - Views
  
  //
  
  // MARK: - Init
  
  override init(frame: CGRect = CGRect.zero) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal Methods
  
  //
  
  // MARK: - Private Methods
  
  private func configure() {
    addSubviews()
    addConstraints()
  }
  
  private func addSubviews() {
    
  }
  
  private func addConstraints() {
    
  }
}

// MARK: - RouteDetailViewLogic

extension RouteDetailView: RouteDetailViewLogic {
  
}
