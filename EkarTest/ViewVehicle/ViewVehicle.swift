//
//  ViewVehicle.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit
import SwiftUI


class ViewVehicle: UIViewController {

    @IBOutlet weak var mainTable: UITableView!
    let viewModel: ViewVehicleViewModel = ViewVehicleViewModel()
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func showIndicator() {
        activityIndicatorView.center = self.view.center
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }

    private func removeIndicator() {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }

    private func configure() {
        viewModel.delegate = self
        self.showIndicator()
        viewModel.fetchVehicelDetails()
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.separatorStyle = .none
        mainTable.register(UINib(nibName: CarouselTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: CarouselTableViewCell.identifier)
        mainTable.register(UINib(nibName: CarDetailsTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: CarDetailsTableViewCell.identifier)
        mainTable.register(UINib(nibName: AboutVehicleTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: AboutVehicleTableViewCell.identifier)
        mainTable.register(UINib(nibName: ProceedTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: ProceedTableViewCell.identifier)

    }

    @IBAction func onClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ViewVehicle: ViewVehicleProtocol {
    func reloadTableView(with viewModel: ViewVehicelModel) {
        self.mainTable.reloadData()
        self.removeIndicator()
    }

}

extension ViewVehicle: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier) as! CarouselTableViewCell
            cell.configure(with: viewModel.vehicleDetails?.images ?? [])
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailsTableViewCell.identifier) as! CarDetailsTableViewCell
            cell.configure(with: viewModel.vehicleDetails)
            cell.sliderUpdated = { [weak self] sliderValue in
                guard let self else {return}
                viewModel.sliderValue = sliderValue
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutVehicleTableViewCell.identifier) as! AboutVehicleTableViewCell
            cell.configure(with: viewModel.vehicleDetails)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProceedTableViewCell.identifier) as! ProceedTableViewCell
            cell.configure(with: viewModel.vehicleDetails)
            cell.onClickProceed = {[weak self] in
                guard let self else {return}
                navigateToDocuments()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

    private func navigateToDocuments() {
        let view = ViewOnBoard()
        let hosting = UIHostingController(rootView: view)
        self.navigationController?.pushViewController(hosting, animated: true)
    }
}
