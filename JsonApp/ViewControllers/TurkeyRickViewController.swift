//
//  TurkeyRickViewController.swift
//  JsonApp
//
//  Created by Татьяна Дубова on 15.11.2023.
//

import UIKit

class TurkeyRickViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    @IBOutlet weak var turkeyRickImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTurkeyRick()

    }
    
    private func fetchTurkeyRick() {
        networkManager.fetch(TurkeyRick.self, from: Link.rickandmortyURL.url) {[unowned self] result in
            switch result {
            case .success(let success):
                print(success)
                configure(with: success)
            case .failure(let failed):
                print(failed)
            }
        }
    }
    
    private func configure(with turkeyRick: TurkeyRick) {
        nameLabel.text = "Name: \(turkeyRick.name ?? "")"
        statusLabel.text = "Status: \(turkeyRick.status ?? "")"
        speciesLabel.text = "Species: \(turkeyRick.species ?? "")"
        typeLabel.text = "Type: \(turkeyRick.type ?? "")"
        genderLabel.text = "Gender: \(turkeyRick.gender ?? "")"
        
        networkManager.fetchImage(from: turkeyRick.image) { result in
            switch result {
            case .success(let imageData):
                self.turkeyRickImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
