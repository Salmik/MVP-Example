//
//  Comment.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    var body: String
}
