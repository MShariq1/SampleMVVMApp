//
//  UniversityVC.swift
//  MVVM Sample
//
//  Created by Shariq on 2023-10-12.
//

import UIKit
import SafariServices

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var data = [UniversityModel]()
    var homeVM = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        homeVM.getUniversities()
    }
    
    func setup() {
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Home"
        homeVM.delegate = self
        table.register(UINib(nibName: "UniversityTVC", bundle: nil), forCellReuseIdentifier: "UniversityTVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "UniversityTVC", for: indexPath) as? UniversityTVC else {return UITableViewCell()}
        cell.setupData(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safari = SFSafariViewController(url: URL(string: data[indexPath.row].web_pages.first ?? "")!)
        safari.modalPresentationStyle = .overFullScreen
        present(safari, animated: true, completion: nil)
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension HomeVC : UniversityDelegate {
    func getUniversitiesSuccessfull(model: [UniversityModel]) {
        DispatchQueue.main.async {
            self.data = model
            self.table.reloadData()
        }
    }
    func getUniversitiesFailed(error: Error) {
        print(error.localizedDescription)
    }
}

