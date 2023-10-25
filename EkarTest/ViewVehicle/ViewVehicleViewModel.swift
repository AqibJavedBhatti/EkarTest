//
//  ViewVehicleViewModel.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import Foundation

protocol ViewVehicleProtocol {
    func reloadTableView(with viewModel: ViewVehicelModel)
}


class ViewVehicleViewModel: ObservableObject {
    var vehicleDetails: ViewVehicelModel?
    var delegate: ViewVehicleProtocol?
    var sliderValue: Float = 4
    private let baseUrl = "https://api.carsxe.com/"
    private let key = "tha91z6lv_j8u1nv4xs_ilfswb1e3"
    private let vin = "JTDZN3EU0E3298500"

    init(vehicleDetails: ViewVehicelModel? = nil) {
        self.vehicleDetails = vehicleDetails
    }

    func fetchVehicelDetails() {
        callVehicleDetailsAPI { result in
            switch result {
            case .success( let response):
                self.vehicleDetails = response
                self.fetchVehicleImages(vehicle: response)
            case .failure(let error):
                self.vehicleDetails = nil
                print(error)
            }
        }
    }

    func fetchVehicleImages(vehicle: ViewVehicelModel) {
        callVehicleImagesAPI(vehicle: vehicle) {result in
            switch result {
            case .success( let response):
                var newVehicle = vehicle
                newVehicle.images = response.images
                self.vehicleDetails = newVehicle
                self.delegate?.reloadTableView(with: newVehicle)
            case .failure(let error):
                self.vehicleDetails = nil
                print(error)
            }
        }
    }

    private func callVehicleImagesAPI(vehicle: ViewVehicelModel, completion: @escaping( (Result<VehicleImageList, APIError>) -> Void) ) {
        var url = baseUrl
        url.append("images?key=\(key)")
        url.append("&vin=\(vin)")
        url.append("&make=\(vehicle.attributes?.make ?? "Toyota")")
        url.append("&model=\(vehicle.attributes?.model ?? "Prius V")")
        url = url.replacingOccurrences(of: " ", with: "%20")
        guard let vehicleDetailsUrl = URL(string: url ) else {return}
        perfromRequest(url: vehicleDetailsUrl, completion: completion)
    }

    private func callVehicleDetailsAPI(completion: @escaping( (Result<ViewVehicelModel, APIError>) -> Void) ) {
        guard let vehicleDetailsUrl = URL(string: "\(baseUrl)specs?key=\(key)&vin=\(vin)") else {return}
        perfromRequest(url: vehicleDetailsUrl, completion: completion)
    }


    private func perfromRequest<T: Codable>(url: URL, completion: @escaping( (Result<T, APIError>) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error  in

            guard let data , error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(Result.success(object))
                }
            } catch {
                completion(.failure(.parsingError))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}

enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}
