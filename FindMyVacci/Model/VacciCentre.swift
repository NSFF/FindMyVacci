//
//  VacciCentre.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 29/04/2022.
//

import UIKit

class VacciCentre {
    var name:String
    var municipality:String
    var street:String
    var zipCode:Int
    
    // I save phoneNumber as String instead of Int because some number use + or #
    var phoneNumber:String
    var gps:[Float]
    var image:UIImage
    
    init(name:String, municipality:String, street:String, zipCode:Int, phoneNumber:String, gps:[Float], image:UIImage) {
        self.name = name
        self.municipality = municipality
        self.street = street
        self.zipCode = zipCode
        
        self.phoneNumber = phoneNumber
        self.gps = gps
        self.image = image
    }
}
