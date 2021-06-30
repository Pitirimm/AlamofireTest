//
//  CollectinViewController.swift
//  AlamofireTest
//
//  Created by Yuriy Martinovskiy on 29.06.2021.
//

import UIKit
import Alamofire

class CollectionViewController: UICollectionViewController {
    
    let amiiboURL = "https://www.amiiboapi.com/api/amiibo/?type=%20Figure"
    var amiibo: [AmiiboInfo] = []
    let itemsPerRaw: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireGetData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amiibo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AmiiboCell
        guard let imageURL = URL(string: amiibo[indexPath.item].image) else { return cell }
        
        switch amiibo[indexPath.item].amiiboSeries {
        case "Super Smash Bros.":
            cell.backgroundColor = UIColor(red: 46/255, green: 255/255, blue: 208/255, alpha: 1.0)
        case "Super Mario Bros.":
            cell.backgroundColor = UIColor(red: 150/255, green: 139/255, blue: 255/255, alpha: 1.0)
        default:
            cell.backgroundColor = .systemPink
        }
        
        cell.layer.cornerRadius = 15.0
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 5.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
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
                    cell.amiiboImage.image = image
                }
            }
        }.resume()
        
        
        return cell
    }
    
    func alamofireGetData() {
        AF.request(amiiboURL)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let jsonData = value as? [String: Any] else { return }
                    guard let amiiboInfo = jsonData["amiibo"] as? Array<[String: Any]> else { return }
                    
                    for dictAmiibo in amiiboInfo {
                       let amiibo = AmiiboInfo(amiiboSeries: dictAmiibo["amiiboSeries"] as! String,
                                               character: dictAmiibo["character"] as! String,
                                               gameSeries: dictAmiibo["gameSeries"] as! String,
                                               name: dictAmiibo["name"] as! String,
                                               image: dictAmiibo["image"] as! String)
                        
                        self.amiibo.append(amiibo)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRaw + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRaw
        return CGSize (width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
