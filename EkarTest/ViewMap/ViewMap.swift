//
//  ViewMap.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit
import MapboxMaps
import CoreLocation
import SwiftUI


let mapBoxToken = "sk.eyJ1IjoiYXFpYi1qYXZlZCIsImEiOiJjbG8zZGtzbTMwbmFhMnFtc3p5c2xmMGYxIn0.pWl4UNlyfjh6CURCoYJLvQ"
class ViewMap: UIViewController {

    let locationManager = CLLocationManager()
    let viewModel: ViewMapViewModel = ViewMapViewModel()
    internal var mapView: MapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        viewModel.delegate = self
        viewModel.configureLocationManager()
    }

    private func configureMapView() {
        let resourceOption = ResourceOptions(accessToken: mapBoxToken)
        let mapInitOptions = MapInitOptions(resourceOptions: resourceOption)
        mapView = MapView(frame: view.bounds, mapInitOptions: mapInitOptions)
        self.view.addSubview(mapView)
        self.view.sendSubviewToBack(mapView)
    }
}

extension ViewMap: ViewMapProtocol {
    func goTo(position: CLLocation, with annotation: PointAnnotation) {
        mapView.camera.ease(to: CameraOptions(center: position.coordinate, zoom: 15),
                            duration: 1.3)
        let annotationManager = mapView.annotations.makePointAnnotationManager()
        annotationManager.annotations = [annotation]
        annotationManager.delegate = self
    }
}

extension ViewMap: AnnotationInteractionDelegate {
    func annotationManager(_ manager: MapboxMaps.AnnotationManager, didDetectTappedAnnotations annotations: [MapboxMaps.Annotation]) {
        if let firstAnnotation = annotations.first {
            if let tuple = viewModel.getAnnotation(from: firstAnnotation) {
                print("index is:" ,tuple.0)
                print("coorindates are :" ,tuple.1.point.coordinates)
                self.navigateToVehicleScreen()
            }
        }
    }

    func navigateToVehicleScreen() {

        let decoder = JSONDecoder()
        if let url = Bundle.main.url(forResource: "view-content-version", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let model = try? decoder.decode(ViewVehicelModel.self, from: data)
            let viewModel = ViewVehicleViewModel(vehicleDetails: model!)
            let vc = ViewVehicle()

            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            fatalError("Can't find demo view contents.")
        }
    }
}


