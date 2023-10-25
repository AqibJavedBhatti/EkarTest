//
//  ViewMapViewModel.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import Foundation
import CoreLocation
import MapboxMaps


protocol ViewMapProtocol {
    func goTo(position: CLLocation, with annotation: PointAnnotation)
}

class ViewMapViewModel: NSObject {
    let locationManager = CLLocationManager()
    var delegate: ViewMapProtocol?
    var annotations: [PointAnnotation] = []
    var annotationAdded: Bool = false
    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewMapViewModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            locationManager.stopUpdatingLocation()
            if annotationAdded {
                return
            }
            annotationAdded = true
            render(location: firstLocation)
        }
    }

    private func render(location : CLLocation) {
        var annotation = PointAnnotation(id: UUID().uuidString,
                                         coordinate: location.coordinate,
                                         isSelected: true,
                                         isDraggable: false)
        annotation.image = .init(image: UIImage(named: "marker")!, name: "marker")
        annotations.append(annotation)
        delegate?.goTo(position: location, with: annotation)
    }

    func getAnnotation(from mapboxPoint: MapboxMaps.Annotation) -> (Int, PointAnnotation)? {
        guard let firstIndex = annotations.firstIndex(where: { $0.id == mapboxPoint.id }) else { return nil }
        return (firstIndex, annotations[firstIndex])
    }
}
