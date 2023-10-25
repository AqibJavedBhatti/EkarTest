//
//  CarouselTableViewCell.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {


    static let identifier = "CarouselTableViewCell"
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!

    var list: [VehicleImage] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        setVIew()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(with images: [VehicleImage]) {
        self.list = images
        self.mainCollectionView.reloadData()
        pageController.numberOfPages = list.count
        pageController.currentPage = 0
    }

    func setVIew () {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        pageController.numberOfPages = list.count
        pageController.isUserInteractionEnabled = false
    }
    
}

extension CarouselTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        cell.configure(With: list[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerPoint = CGPoint(x: self.contentView.screenWidth/2 , y: self.contentView.screenHeight/5)
        let collectionViewCenterPoint = self.convert(centerPoint, to: mainCollectionView)
        if let indexPath = mainCollectionView.indexPathForItem(at: collectionViewCenterPoint){
            self.pageController.currentPage = indexPath.row
        }
    }
}

extension UIView {
    var screenWidth:CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }

    var screenHeight:CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }

}
