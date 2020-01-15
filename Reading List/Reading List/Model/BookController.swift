//
//  BookController.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

//Conform to Codable to encode Book objects to Property-List form (plist)
class BookController: Codable {
    
    
    var books: [Book]
    
    private var readingListURL: URL? {
        
        let fileManager = FileManager.default
        
        guard let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return document.appendingPathComponent("ReadingList.plist")
    }
}
