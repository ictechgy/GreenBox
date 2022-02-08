//
//  MapViewController.swift
//  GreenBox
//
//  Created by JINHONG AN on 2022/02/07.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    //MARK: Properties
    @IBOutlet private weak var naverMapView: NMFNaverMapView!

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapView()
    }
}

//MARK: - UI
extension MapViewController {
    private func setUpMapView() {
        naverMapView.showCompass = true
        naverMapView.showScaleBar = true
        naverMapView.showZoomControls = true
        naverMapView.showIndoorLevelPicker = false
        naverMapView.showLocationButton = true
    }
}
