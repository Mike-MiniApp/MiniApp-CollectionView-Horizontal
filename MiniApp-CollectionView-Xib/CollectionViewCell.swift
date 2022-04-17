//
//  CollectionViewCell.swift
//  MiniApp-CollectionView-Xib
//
//  Created by 近藤米功 on 2022/04/17.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
    }

}
