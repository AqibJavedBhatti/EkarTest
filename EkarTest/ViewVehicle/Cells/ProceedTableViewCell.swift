//
//  ProceedTableViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 25/10/2023.
//

import UIKit

class ProceedTableViewCell: UITableViewCell {

    static let identifier = "ProceedTableViewCell"
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var details: UILabel!

    var onClickProceed: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with car: ViewVehicelModel?) {
        guard let vehicle = car else {return}
        firstName.text = vehicle.attributes?.make ?? ""
        secondName.text = vehicle.attributes?.model ?? ""
        details.text = vehicle.attributes?.style ?? ""
    }

    @IBAction func onClickProceed(_ sender: UIButton) {
        self.onClickProceed?()
    }
    
}
