//
//  CNJoke.swift
//  CallingAPI
//
//  Created by Matteo on 08/01/2023.
//

import SwiftUI

struct CNJoke: Codable, Identifiable {
    
    var icon_url: String = ""
    var id: String = ""
    var url: String = ""
    var value: String = ""
    
    var isJokeShowing: Bool {
        value.count > 0
    }

}

class FavouriteJokes: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case jokes
    }
    
    @Published var jokes : [CNJoke] = []
    
    var hasJokes: Bool {
        jokes.count > 0
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(jokes, forKey: .jokes)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        jokes = try container.decode([CNJoke].self, forKey: .jokes)
    }
}
