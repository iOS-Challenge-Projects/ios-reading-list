//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
