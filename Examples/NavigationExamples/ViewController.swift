//
//  ViewController.swift
//  NavigationExamples
//
//  Created by Huy Dang on 21/11/2022.
//

import UIKit
import Map4dMap
import Map4dServices
import Map4dNavigation

class ViewController: UIViewController {
  
  var mapView: MFMapView!
  var targetMarker: MFMarker!
  
  var addButton: UIButton!
  var clearButton: UIButton!
  var startButton: UIButton!
  
  var waypointMarkers: [MFMarker] = []
  
  override func loadView() {
    mapView = MFMapView(frame: .zero)
    mapView.setMyLocationEnabled(true)
    mapView.settings.myLocationButton = true
    mapView.delegate = self
    view = mapView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    
    targetMarker = MFMarker()
    if let camera = mapView.camera {
      targetMarker.position = camera.target
    }
    targetMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
    targetMarker.icon = UIImage(named: "target")
    targetMarker.map = mapView
  }
  
  @objc func didTapAddButton(sender: UIButton) {
    guard let camera = mapView.camera else { return }
    let marker = MFMarker()
    marker.position = camera.target
    marker.icon = UIImage(named: "pick")
    marker.map = mapView
    
    waypointMarkers.append(marker)
    startButton.isEnabled = true
  }
  
  @objc func didTapClearButton(sender: UIButton) {
    waypointMarkers.forEach { marker in
      marker.map = nil
    }
    waypointMarkers.removeAll()
    startButton.isEnabled = false
  }
  
  @objc func didTapStartButton(sender: UIButton) {
    guard waypointMarkers.count > 0 else {
      return
    }
    
    guard let myLocation = mapView.getMyLocation() else {
      return
    }
    
    let origin = MFLocationComponent(coordinate: myLocation.coordinate)
    let destination = MFLocationComponent(coordinate: waypointMarkers.last!.position)
    
    let params = MFDirectionsParams(origin: origin, destination: destination)
    if (waypointMarkers.count > 1) {
      var waypoints = waypointMarkers.map { marker in
        return MFLocationComponent(coordinate: marker.position)
      }
      waypoints.removeLast()
      params.waypoints = waypoints
    }
    
    let service = MFDirectionsService()
    service.fetchDirections(with: params) { [weak self] directions, error in
      guard let directions = directions else {
        dump(error)
        return
      }
      
      let options = MFNavigationOptions()
      //options.isSimulateRoute = true
      let navigation = MFNavigationViewController(directionsResult: directions,
                                                  routeIndex: 0,
                                                  directionsParams: params,
                                                  navigationOptions: options)
      navigation.modalPresentationStyle = .fullScreen
      self?.present(navigation, animated: true, completion: nil)
    }
  }
}

extension ViewController: MFMapViewDelegate {
  func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!) {
    targetMarker.position = position.target
  }
}

extension ViewController {
  func setupLayout() {
    addButton = UIButton(type: .custom)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    addButton.setTitle("Add", for: .normal)
    addButton.setTitleColor(.red, for: .normal)
    addButton.addTarget(self, action:#selector(didTapAddButton(sender:)), for: .touchUpInside)
    
    clearButton = UIButton(type: .custom)
    clearButton.translatesAutoresizingMaskIntoConstraints = false
    clearButton.setTitle("Clear", for: .normal)
    clearButton.addTarget(self, action: #selector(didTapClearButton(sender:)), for: .touchUpInside)
    
    startButton = UIButton(type: .custom)
    startButton.translatesAutoresizingMaskIntoConstraints = false
    startButton.setTitle("Start", for: .normal)
    startButton.setTitleColor(.blue, for: .normal)
    startButton.addTarget(self, action: #selector(didTapStartButton(sender:)), for: .touchUpInside)
    
    view.addSubview(addButton)
    view.addSubview(clearButton)
    view.addSubview(startButton)
    
    setupConstraints()
  }
  
  func setupConstraints() {
    addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true;
    addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    addButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    clearButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 25).isActive = true
    clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true;
    clearButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    clearButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    startButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 25).isActive = true
    startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true;
    startButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    startButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
  }
}
