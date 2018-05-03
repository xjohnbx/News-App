//
//  Article.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit
import Foundation

class Article: NSObject {
    var Author: String!
    var Title: String!
    var Description: String!
    var URL: String!
    var URLToImage: String!
    var PublishedAt: String!
    var Source: String!
    
    init(Author: String, Title: String, Description: String, URL: String, URLToImage: String, PublishedAt: String, Source: String)
    {
        self.Author = Author
        self.Title = Title
        self.Description = Description
        self.URL = URL
        self.URLToImage = URLToImage
        self.PublishedAt = PublishedAt
        self.Source = Source
    }
}
