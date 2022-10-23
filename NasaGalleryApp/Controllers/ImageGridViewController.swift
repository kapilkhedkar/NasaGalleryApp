//
//  ImageGridViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import UIKit
import Lottie
import SDWebImage
import RappleProgressHUD

class ImageGridViewController: UIViewController {

    @IBOutlet weak var noInternetAnimationView: AnimationView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var retryButton: UIButton!
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
        
        setupUI()
        
        getSpaceDataFromJSON()
        
    }
    
    func setupUI()
    {
        noInternetAnimationView.contentMode = .scaleAspectFit
        noInternetAnimationView.loopMode = .loop
        noInternetAnimationView.play()
        
        retryButton.backgroundColor = AppStyles.getAppColor(color: .ctaBgColor)
        retryButton.layer.cornerRadius = AppStyles.itemCornerRadius
        retryButton.layer.masksToBounds = true
        retryButton.tintColor = AppStyles.getAppColor(color: .ctaTintColor)
        retryButton.titleLabel?.font = AppStyles.getFontStyle(style: .ctaText)
        
    }
    
    func getSpaceDataFromJSON()
    {
        if Connectivity.isConnectedToInternet
        {
            noInternetAnimationView.isHidden = true
            retryButton.isHidden = true
            collectionView.isHidden = false

            RappleActivityIndicatorView.startAnimating()

            self.imageDataArray = DataParser.getImagesData()
            self.collectionView.reloadData()

            self.collectionView.performBatchUpdates(nil, completion: {
                (result) in
                // ready
                RappleActivityIndicatorView.stopAnimation()
            })

        }else
        {
            noInternetAnimationView.isHidden = false
            retryButton.isHidden = false
            collectionView.isHidden = true

        }
        
    }
    
    // MARK: - Clicks
    
    @IBAction func retryButtonTapped(_ sender: UIButton) {
        
        getSpaceDataFromJSON()
        
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
        cell.itemImageView.sd_setImage(with: URL(string: dataItem.hdurl), placeholderImage: nil, options: [.progressiveLoad])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailMainViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageDetailMainViewController") as! ImageDetailMainViewController
        detailMainViewController.imageDataArray = self.imageDataArray
        detailMainViewController.selectedPageIndex = indexPath.row
        detailMainViewController.modalPresentationStyle = .fullScreen
        self.present(detailMainViewController, animated: true)
        
    }
    
}
