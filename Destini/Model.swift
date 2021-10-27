//
//  Model.swift
//  Destini
//
//  Created by Алишер Алсейт on 27.10.2021.
//

import Foundation

struct Question: Identifiable, Decodable {
    
    var id: Int
    var content: String
    var answers: [String]
}
