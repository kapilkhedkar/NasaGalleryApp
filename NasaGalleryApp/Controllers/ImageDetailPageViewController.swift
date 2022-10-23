//
//  ImageDetailPageViewController.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 23/10/22.
//

import UIKit

class ImageDetailPageViewController: UIPageViewController,UIPageViewControllerDataSource {

    //
    var selectedPageIndex : Int = 0
    var imageDataArray = [ImageDataItem]()
    
    var pageToMainDelegate : DetailsContentToMainProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        self.setViewControllers([getViewControllerAtIndex(index: selectedPageIndex)] as [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContent: ImageDetailContentViewController = viewController as! ImageDetailContentViewController
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1
        return getViewControllerAtIndex(index: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let pageContent: ImageDetailContentViewController = viewController as! ImageDetailContentViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound)
        {
            return nil;
        }
        index += 1
        if (index == imageDataArray.count)
        {
            return nil
        }
        return getViewControllerAtIndex(index: index)
        
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> ImageDetailContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageDetailContentViewController") as! ImageDetailContentViewController
        pageContentViewController.imageUrl = imageDataArray[index].hdurl
        pageContentViewController.pageIndex = index
        pageContentViewController.contentToPageDelegate = self
        return pageContentViewController
        
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

extension ImageDetailPageViewController : DetailsContentToMainProtocol
{
    func updatePageIndex(pageIndex: Int) {
        self.pageToMainDelegate?.updatePageIndex(pageIndex: pageIndex)
    }
    
}
