//
//  CarDetailsTableViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit

let randomColors : [UIColor] = [.black,.red,.orange,.yellow,.blue]

class CarDetailsTableViewCell: UITableViewCell {

    static let identifier = "CarDetailsTableViewCell"
    @IBOutlet weak var availableColors: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    var sliderValue: Float = 4
    var sliderUpdated: ((Float)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with details: ViewVehicelModel?) {
        guard let details else {return}
        yearLabel.text = "Year - \(details.attributes?.year ?? "")"
        generateColors(colors: details.colors ?? [])
    }

    func generateColors(colors: [Colors]) {
        availableColors.text = "Available Colors: \(colors.count)"
    }

    @IBAction func yearChange(sender: UISlider) {

        switch sender.value {
        case 0...0.5:
            sender.value = 0
        case 0.51...1.5:
            sender.value = 1
        case 1.51...2.5:
            sender.value = 2
        case 2.51...3.5:
            sender.value = 3
        default:
            sender.value = 4
        }
        self.sliderValue = sender.value
        self.sliderUpdated?(sliderValue)
    }
    
}
