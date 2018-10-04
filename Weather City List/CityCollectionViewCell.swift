//
//  CityCollectionViewCell.swift
//  Weather City List
//
//  Created by Vadym Sushko on 9/28/18.
//  Copyright © 2018 Vadym Sushko. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionCellImage: UIImageView! {
        didSet {
            actIndicator.stopAnimating()
        }
    }
    @IBOutlet weak var collectionCellCityLabel: UILabel!
    
    @IBOutlet weak var collectionCellTemperature: UILabel!
    
}
