//
//  KFCollectionViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 25/10/2023.
//

import UIKit

class KFCollectionViewCell: UICollectionViewCell {

    static let identifier = "KFCollectionViewCell"

    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configure(with feature: String) {
        mainLabel.text = feature
    }
}
