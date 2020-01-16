//
//  ViewController.swift
//  Reading List
//
//  Created by Spencer Curtis on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var bookController: BookController?
    var book: Book?
    
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var resonToRead: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTap(_ sender: UIBarButtonItem) {
        if let newBook = book {
            bookController?.updateDetails(for: newBook)
        } else if let title = titleText.text, let reason = resonToRead.text {
            bookController?.Create(title: title, reasonToRead: reason)
        }
    }
    
    func updateViews(){
        if let updateBook =  book {
            titleText.text = updateBook.title
            resonToRead.text = updateBook.reasonToRead
            self.title = updateBook.title
        } else {
             self.title = "Add a new book"
        }
    }
    
}

