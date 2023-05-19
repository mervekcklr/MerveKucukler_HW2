//
//  News.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 13.05.2023.
//

import Foundation
struct News : Decodable {
    let section : String?
    let results : [NewsResults]?
}
struct NewsResults: Decodable {
    let url: String
    let multimedia: [Multimedia]?
    let  section : String
    let title : String
    let abstract : String
    let byline : String
}

struct Multimedia : Decodable {
    let url : String
}
