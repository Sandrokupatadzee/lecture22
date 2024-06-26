//
//  Country.swift
//  lecture22
//
//  Created by MacBook Pro on 26.04.24.
//

import Foundation

struct Country: Decodable {
    
    let name: Name?
    let capital: [String]?
    let region: String
    let subregion: String?
    let continents: [String]
    let landlocked: Bool
    let area: Double
    let borders: [String]?
    let flag: String
    let altSpellings: [String]
    let population: Int
    let timezones: [String]
    let startOfWeek: String
    let fifa: String?
    let flags: Flags
    let maps: Maps
}

struct Name: Decodable {
    var official: String?
    var common: String?
}

struct Flags: Decodable {
    let png: String
    let svg: String
    let alt: String?
}

struct Maps: Decodable {
    
    let googleMaps: String
    let openStreetMaps: String
}
