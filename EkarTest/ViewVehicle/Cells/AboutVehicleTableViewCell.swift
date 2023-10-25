//
//  AboutVehicleTableViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 25/10/2023.
//

import UIKit

class AboutVehicleTableViewCell: UITableViewCell {

    static let identifier = "AboutVehicleTableViewCell"
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    @IBOutlet weak var KFCollectionView: UICollectionView!


    let keyFeatures = ["Keyless Entry", "Bluetooth" , "Power Windows", "ABS Breaks with EBD", "AUX/USB Jack" , "AM/FM", "Multimedia Steering"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }

    private func configureCollectionView() {
        KFCollectionView.dataSource = self
        KFCollectionView.delegate = self
        KFCollectionView.register(UINib(nibName: KFCollectionViewCell.identifier, bundle: .main), forCellWithReuseIdentifier: KFCollectionViewCell.identifier)
    }

    func configure(with car: ViewVehicelModel?) {
        guard let vehicle = car else {return}
        let all = (vehicle.attributes?.engine ?? "").split(separator: " ")
        label1.text = "\(all.first ?? "3L Engine")"
        label2.text = vehicle.attributes?.standard_seating ?? "2 Seats"
        label3.text = vehicle.attributes?.transmission_short ?? "Manual"
        label4.text = vehicle.attributes?.fuel_type == "" ? "Patrol" : vehicle.attributes?.fuel_type
    }
    
}

extension  AboutVehicleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyFeatures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KFCollectionViewCell.identifier, for: indexPath) as! KFCollectionViewCell
        cell.configure(with: keyFeatures[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (keyFeatures[indexPath.row].count * 8), height: 25)
    }

}
