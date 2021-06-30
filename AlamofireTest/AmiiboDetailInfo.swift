//
//  AmiiboDetailInfo.swift
//  AlamofireTest
//
//  Created by Yuriy Martinovskiy on 30.06.2021.
//

import UIKit

class AmiiboDetailInfo: UIViewController {
    
    @IBOutlet weak var amiiboImage: UIImageView!
    @IBOutlet weak var amiiboName: UILabel!
    @IBOutlet weak var gameSeries: UILabel!
    
    var name: String = ""
    var game: String = ""
    var image: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amiiboName.text = "Amiibo name: \(name)"
        gameSeries.text = "Game series: \(game)"
        
        guard let imageURL = URL(string: image) else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            if let response = response {
                print(response)
            }

            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.amiiboImage.image = image
                }
            }
        }.resume()
    }
}
