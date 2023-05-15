//
//  Decoders.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 13.05.2023.
//

import Foundation
public enum Decoders {
    static let dataDecoder : JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    } ()
}
