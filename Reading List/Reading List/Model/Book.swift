//
//  Book.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    //Setting an initial value for hasBeenRead
    init(title: String,reasonToRead: String, hasBeenRead: Bool = false) {
        self.hasBeenRead = hasBeenRead
        self.title = title
        self.reasonToRead = reasonToRead
    }
}
