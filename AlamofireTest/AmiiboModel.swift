//
//  AmiiboModel.swift
//  AlamofireTest
//
//  Created by Yuriy Martinovskiy on 29.06.2021.
//

struct AmiiboModel: Decodable {
    let amiibo: [AmiiboInfo]
    
    static func getData(from value: Any) -> AmiiboModel? {
        guard let amiiboData = value as? AmiiboModel else { return nil }
        return amiiboData
    }
    
    static func getAmiibo() -> AmiiboModel {
        let amiibo = AmiiboModel(amiibo: [
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png"),
            AmiiboInfo(amiiboSeries: "Super Mario Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00340102.png"),
            AmiiboInfo(amiiboSeries: "Super Mario Bros.",
                       character: "Luigi",
                       gameSeries: "Super Mario",
                       name: "Luigi",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00010000-00350102.png"),
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Wolf",
                       gameSeries: "Star Fox",
                       name: "Wolf",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_05840000-037e0002.png"),
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png"),
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png"),
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png"),
            AmiiboInfo(amiiboSeries: "Super Smash Bros.",
                       character: "Mario",
                       gameSeries: "Super Mario",
                       name: "Mario",
                       image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png")
            ])
        return amiibo
    }
}

struct AmiiboInfo: Decodable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let name: String
    let image: String
   
}
