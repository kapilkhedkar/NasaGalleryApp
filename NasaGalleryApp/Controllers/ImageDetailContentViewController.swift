//
//  ImageDetailContentViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 23/10/22.
//

import UIKit
import SDWebImage
import Zoomy

class ImageDetailContentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    //
    
    var pageIndex : Int = 0
    var imageUrl : String = ""
    
    var contentToPageDelegate : DetailsContentToMainProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addZoombehavior(for: imageView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentToPageDelegate?.updatePageIndex(pageIndex: self.pageIndex)
        
        if !imageUrl.isEmpty
        {
            imageView.sd_setImage(with: URL(string: imageUrl))
    
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
