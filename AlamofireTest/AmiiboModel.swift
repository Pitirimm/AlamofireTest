//
//  AmiiboModel.swift
//  AlamofireTest
//
//  Created by Yuriy Martinovskiy on 29.06.2021.
//

struct AmiiboModel: Decodable {
    let amiibo: [AmiiboInfo]
}

struct AmiiboInfo: Decodable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let name: String
    let image: String
   
}
