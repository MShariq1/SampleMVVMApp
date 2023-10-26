//
//  ViewModel.swift
//  MVVM Sample
//
//  Created by Shariq on 2023-10-12.
//

import Foundation

protocol UniversityDelegate: AnyObject {
    func getUniversitiesSuccessfull(model: [UniversityModel])
    func getUniversitiesFailed(error: Error)

}

class HomeViewModel {
    weak var delegate: UniversityDelegate?
    
    func getUniversities() {
        UiversityApiManager.shared.GetAllUniversity { model, error in
            if error == nil && model?.count != 0 {
                self.delegate?.getUniversitiesSuccessfull(model: model!)
            } else{
                self.delegate?.getUniversitiesFailed(error: error!)
            }
        }
    }
    
}

extension UniversityDelegate {
    
    func getUniversitiesSuccessfull(model: [UniversityModel]){}
    func getUniversitiesFailed(error: Error){}

}
