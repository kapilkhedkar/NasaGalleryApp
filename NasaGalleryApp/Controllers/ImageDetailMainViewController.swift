//
//  ImageDetailMainViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 23/10/22.
//

import UIKit
import PanModal

class ImageDetailMainViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    //
    var selectedPageIndex : Int = 0
    var imageDataArray = [ImageDataItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    func setupUI()
    {
        backButton.tintColor = AppStyles.getAppColor(color: .iconTintColor)
        infoButton.tintColor = AppStyles.getAppColor(color: .iconTintColor)
        
    }
    
    
    
    // MARK: - Clicks
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        
        let detailsBottomSheetVC = DetailsBottomSheetViewController()
        detailsBottomSheetVC.imageDetails = imageDataArray[selectedPageIndex]
        self.presentPanModal(detailsBottomSheetVC)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "containerSegue"
        {
            let pageVC = segue.destination as! ImageDetailPageViewController
            pageVC.imageDataArray = self.imageDataArray
            pageVC.selectedPageIndex = self.selectedPageIndex
            pageVC.pageToMainDelegate = self
            
        }
        
        
    }
    

}

extension ImageDetailMainViewController : DetailsContentToMainProtocol
{
    func updatePageIndex(pageIndex: Int) {
        self.selectedPageIndex = pageIndex
    }
    
}
