//
//  ApiManager.swift
//  MVVM Sample
//
//  Created by Shariq on 25/10/2023.
//

import Foundation


class UiversityApiManager: NSObject {
    
    static let shared = UiversityApiManager()


    func GetAllUniversity(completion: @escaping ([UniversityModel]?, Error?) -> ()) {
        let universityURL = "http://universities.hipolabs.com/search?name=middle"
        
        if let url = URL(string: universityURL) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil, error)
                } else if let data = data {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                            let status = (response as? HTTPURLResponse)?.statusCode

                            if status == 200 {
                                var model = [UniversityModel]()
                                for jsonData in jsonArray {
                                    let university = UniversityModel(data: jsonData)
                                    model.append(university)
                                }
                                completion(model, nil)
                            } else {
                                if let errorMessage = jsonArray.first?["error"] as? String {
                                    completion(nil, NSError(domain: "YourErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
                                }
                            }
                        }
                    } catch {
                        print(error)
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }


}

