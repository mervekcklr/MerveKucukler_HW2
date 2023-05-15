//
//  News.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 13.05.2023.
//

import Foundation
public struct News : Decodable {
    public let section : String?
    //public let status : String?
    public let results : [NewsResults]?
    
   }


public struct NewsResults: Decodable {
    public let url: String
   public let multimedia: [Multimedia]?
    public let  section : String
    public  let title : String
    public let abstract : String
    public let byline : String
    
    
    }



public struct Multimedia : Decodable {
    let url : String
}
