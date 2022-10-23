//
//  NasaGalleryAppTests.swift
//  NasaGalleryAppTests
//
//  Created by Kapil Khedkar on 23/10/22.
//

import XCTest
import NasaGalleryApp

class NasaGalleryAppTests: XCTestCase {
    
    func testChangeDateFormats()
    {
        //Given
        let ipDateStr = "1993-08-25"
        let fromFormat = "yyyy-MM-dd"
        let toFormat = "d MMMM yyyy"
        
        //When
        let dispDateStr = CommonFunctions.changeDateFormats(ipDateStr: ipDateStr, fromFormat: fromFormat, toFormat: toFormat)
        
        //Then
        XCTAssertEqual(dispDateStr, "25 August 1993")
        
    }

}
