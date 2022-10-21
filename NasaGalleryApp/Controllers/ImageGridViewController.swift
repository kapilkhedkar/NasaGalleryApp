//
//  ImageGridViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import UIKit
import Lottie
import SDWebImage

class ImageGridViewController: UIViewController {

    @IBOutlet weak var logoAnimationView: AnimationView!
    @IBOutlet weak var noInternetAnimationView: AnimationView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //
    
    var imageDataArray = [ImageDataItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GridItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridItemCollectionViewCell")
        
        collectionView.collectionViewLayout = CommonFunctions.createCompositionalLayout()
        
        getSpaceDataFromJSON()
        
    }
    
    func getSpaceDataFromJSON()
    {
        if Connectivity.isConnectedToInternet
        {
            noInternetAnimationView.isHidden = true
            collectionView.isHidden = false
            
            self.imageDataArray = DataParser.getImagesData()
            self.collectionView.reloadData()
            
        }else
        {
            noInternetAnimationView.isHidden = false
            collectionView.isHidden = true
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImageGridViewController : UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageDataArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItemCollectionViewCell", for: indexPath) as! GridItemCollectionViewCell
        
        let dataItem = imageDataArray[indexPath.row]
        
        cell.itemImageView.sd_setImage(with: URL(string: dataItem.hdurl))
        
        return cell
        
    }
    
}
