//
//  RickAndMorty.swift
//  JsonApp
//
//  Created by Татьяна Дубова on 11.11.2023.
//

import Foundation

struct TurkeyRick: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
