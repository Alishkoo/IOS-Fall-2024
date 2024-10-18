//
//  FavCell.swift
//  CollectionExample
//
//  Created by Arman Myrzakanurov on 16.10.2024.
//

import UIKit

class FavCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!

    func configure(_ image: UIImage, _ title: String) {
        titleLabel.text = title
        coverImage.image = image
    }

}
