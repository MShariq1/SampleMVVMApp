//
//  UniversityTVC.swift
//  MVVM Sample
//
//  Created by Shariq on 2023-10-12.
//

import UIKit

class UniversityTVC: UITableViewCell {

    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupData(data: UniversityModel) {
        lblUniversityName.text = data.universityName
        lblCountryName.text = data.countryName
    }
    
}
