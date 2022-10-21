//
//  DataParser.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataParser
{
    class func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    class func getImagesData()->[ImageDataItem]
    {
        var imageDataArray = [ImageDataItem]()
        
        if let data = readLocalJSONFile(forName: "data") {
            if let json = try? JSON(data: data) {
                
                for item in json["imageData"].arrayValue {
                    
                    let title = item["title"].stringValue
                    let explanation = item["explanation"].stringValue
                    let date = item["date"].stringValue
                    let hdurl = item["hdurl"].stringValue
                    let copyright = item["copyright"].stringValue
                    
                    let imgObj = ImageDataItem(title: title, explanation: explanation, date: date, hdurl: hdurl, copyright: copyright)
                    
                    imageDataArray.append(imgObj)
                    
                }
            }
        }
        
        return imageDataArray
        
    }
    
}
