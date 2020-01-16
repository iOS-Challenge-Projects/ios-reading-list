//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var delegate: BookTableViewCellDelegate?
    
    var book: Book?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func checkButton(_ sender: UIButton) {
        //self.tag has the index so we pass it to the delegate
        delegate?.toggleHasBeenRead(for: self)
    }
    
    func updateViews() {
        
        guard let singleBook = book else { return }
        
        titleLabel.text = singleBook.title
        
        let image = singleBook.hasBeenRead ? UIImage(named: "checked") : UIImage(named: "unchecked")
        
        checkButton.setImage(image, for: .normal)
    }
}
