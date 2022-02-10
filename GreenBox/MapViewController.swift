//
//  MapViewController.swift
//  GreenBox
//
//  Created by JINHONG AN on 2022/02/07.
//

import UIKit
import NMapsMap

final class MapViewController: UIViewController {
    //MARK: Properties
    @IBOutlet private weak var naverMapView: NMFNaverMapView!
    private let locationManager = CLLocationManager()

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapView()
        locationManager.delegate = self
    }
}

//MARK: - UI
extension MapViewController {
    private func setUpMapView() {
        naverMapView.showCompass = true
        naverMapView.showScaleBar = true
        naverMapView.showZoomControls = true
        naverMapView.showIndoorLevelPicker = false
    }
}

//MARK: - Conform to CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        stopUsingLocationInformation()
        
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            prepareToUseLocationInformation()
        case .denied, .restricted:
            break
        @unknown default:
            break
        }
    }
    
    private func prepareToUseLocationInformation() {
        naverMapView.showLocationButton = true
        
        let fiveMeters = 5.0
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = fiveMeters
        locationManager.startUpdatingLocation()
    }

    private func stopUsingLocationInformation() {
        naverMapView.showLocationButton = false
        
        locationManager.stopUpdatingLocation()
    }
}
