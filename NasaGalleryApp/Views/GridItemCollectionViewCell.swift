//
//  GridItemCollectionViewCell.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import UIKit

class GridItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemImageView.layer.cornerRadius = AppStyles.itemCornerRadius
        itemImageView.layer.masksToBounds = true
        
        
    }

}
