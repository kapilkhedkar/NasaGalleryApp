//
//  DetailsBottomSheetViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 23/10/22.
//

import UIKit
import PanModal

class DetailsBottomSheetViewController: UIViewController {
    
    @IBOutlet weak var copyrightTextLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var explainationTextLabel: UILabel!
    
    //
    
    var imageDetails : ImageDataItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
    }

    func setupUI()
    {
        copyrightTextLabel.font = AppStyles.getFontStyle(style: .placeholderText)
        copyrightTextLabel.textColor = AppStyles.getAppColor(color: .secondaryTextColor)
        
        titleTextLabel.font = AppStyles.getFontStyle(style: .titleText)
        titleTextLabel.textColor = AppStyles.getAppColor(color: .primaryTextColor)
        
        explainationTextLabel.font = AppStyles.getFontStyle(style: .subtitleText)
        explainationTextLabel.textColor = AppStyles.getAppColor(color: .primaryTextColor)
        
        let dispDate = CommonFunctions.changeDateFormats(ipDateStr: imageDetails!.date, fromFormat: "yyyy-MM-dd", toFormat: "d MMMM yyyy")
        copyrightTextLabel.text = "© \(imageDetails?.copyright ?? "") on \(dispDate)"
        titleTextLabel.text = imageDetails?.title
        explainationTextLabel.text = imageDetails?.explanation
        
        
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

extension DetailsBottomSheetViewController : PanModalPresentable
{
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(40)
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
}
