//
//  CommonFunctions.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import Foundation
import UIKit

class CommonFunctions
{
    
    class func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let inset: CGFloat = 5
        
        // Large item on top
        let topItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
        let topItem = NSCollectionLayoutItem(layoutSize: topItemSize)
        topItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // Bottom item
        let bottomItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let bottomItem = NSCollectionLayoutItem(layoutSize: bottomItemSize)
        bottomItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        // Group for bottom item, it repeats the bottom item twice
        let bottomGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
        let bottomGroup = NSCollectionLayoutGroup.horizontal(layoutSize: bottomGroupSize, subitem: bottomItem, count: 3)
        
        // Combine the top item and bottom group
        let fullGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6 + 0.3))
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: fullGroupSize, subitems: [topItem, bottomGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
    
    
}
