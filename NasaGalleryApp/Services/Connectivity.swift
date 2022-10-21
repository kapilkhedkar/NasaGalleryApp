//
//  Connectivity.swift
//  NasaGalleryApp
//
//  Created by Kapil Khedkar on 21/10/22.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
