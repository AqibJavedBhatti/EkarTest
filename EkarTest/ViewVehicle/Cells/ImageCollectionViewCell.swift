//
//  ImageCollectionViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "ImageCollectionViewCell"
    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(With object : VehicleImage) {
        guard let url  = URL(string: object.thumbnailLink ?? "") else {return}
        mainImage.sd_setImage(with: url)
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
