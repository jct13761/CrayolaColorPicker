//
//  crayolaData.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/10/21.
//

import SwiftUI

public class GetCrayolaData: ObservableObject {
    @Published var hex = [CrayolaDataLayout]()
    @Published var name = [CrayolaDataLayout]()
    @Published var rgb = [CrayolaDataLayout]()
    
    init() {
        load()
    }
    
    func load() {
        let dataUrl = URL(string: "https://gist.githubusercontent.com/jjdelc/1868136/raw/c9160b1e60bd8c10c03dbd1a61b704a8e977c46b/crayola.json")!
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataUrl) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try decoder.decode([CrayolaDataLayout].self, from: d)
                    DispatchQueue.main.async {
                        self.hex = decodedLists
                        self.name = decodedLists
                        self.rgb = decodedLists
                    }
                } else {
                    print("No Data")
                } // if-else
            } catch {
                print("Error")
            } // do-catch
        }.resume()
    }
}

struct CrayolaDataLayout: Codable, Identifiable {
    public var id: String
    public var name: String
    public var rgb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "hex"
        case name = "name"
        case rgb = "rgb"
    }
}

