//
//  AllApi.swift
//  NewsApp
//
//  Created by USER on 13/09/2022.
//

import Foundation

class AllApi {
    
  
    //https://newsapi.org/v2/top-headlines?country=IN&category=sports&apiKey=1c92c0cc3285425fb8ee9c239548f7fc
    
    static let BASE_URL = "https://newsapi.org/v2/top-headlines?"
    
    static let V1 = ""
    
    static let NEWS_REQUEST = BASE_URL + V1 + "country=IN&category=sports&"
    
}

