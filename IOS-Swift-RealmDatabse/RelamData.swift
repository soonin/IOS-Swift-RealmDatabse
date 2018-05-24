//
//  RelamData.swift
//  IOS-Swift-RealmDatabse
//
//  Created by Pooya Hatami on 2018-05-18.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import Foundation
import RealmSwift

class CityLib: Object {
    @objc dynamic var cityName = ""
    @objc dynamic var provinceName = ""
    @objc dynamic var countryName = ""

}
