//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {
    
    var bookController = BookController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return bookController.readBooks.count
        }else {
            return bookController.unreadBooks.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        
        //set sekf as dekegate
        cell.delegate = self
        
        let book = bookFor(indexPath: indexPath)
        
        cell.book = book
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Read Books"
        }else {
            return "Unread Books"
        }
    }
    
    
    
    func bookFor(indexPath: IndexPath) -> Book {
        print(indexPath.section)
        if indexPath.section == 0{
            return bookController.readBooks[indexPath.row]
        }else {
            return bookController.unreadBooks[indexPath.row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue"{
            guard let bookDetailVC = segue.destination as? BookDetailViewController else { return }
            bookDetailVC.bookController = bookController
        }else if segue.identifier == "updateBook"{
            guard let bookDetailVC = segue.destination as? BookDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else {return }
            bookDetailVC.book = bookController.books[indexPath.row]
        }
    }
}


//MARK: - Delegate
extension ReadingListTableViewController: BookTableViewCellDelegate {
    
    
    func toggleHasBeenRead(for cell: BookTableViewCell) {
        
        let book = bookController.books[cell.tag]
        //Need to pass the book that was clicked
        bookController.updateHasBeenRead(for: book )
        
        tableView.reloadData()
    }
    
}
