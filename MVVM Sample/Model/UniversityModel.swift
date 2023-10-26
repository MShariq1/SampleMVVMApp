//
//  Models.swift
//  MVVM Sample
//
//  Created by Shariq on 25/10/2023.
//

import Foundation

struct UniversityModel {
    var universityName: String
    var countryName: String
    var web_pages: [String]

    init(data: [String: Any]) {
        universityName = data["name"] as? String ?? ""
        countryName = data["country"] as? String ?? ""
        web_pages = data["web_pages"] as? [String] ?? []
    }
}
