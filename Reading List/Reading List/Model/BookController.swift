//
//  BookController.swift
//  Reading List
//
//  Created by FGT MAC on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

//Conform to Codable to encode Book objects to Property-List form (plist)
class BookController {
    
    //Array of book objects
    var books: [Book] = [Book(title: "Test", reasonToRead: "Test")]
    
    var readBooks: [Book] {
        
        var readArr: [Book] = []
        for book in books {
            if book.hasBeenRead {
                readArr.append(book)
            }
        }
        return readArr
    }
    
    var unreadBooks: [Book] {
        var unreadArr: [Book] = []
        for book in books {
            if !book.hasBeenRead {
                unreadArr.append(book)
            }
        }
        return unreadArr
    }
    
    //Computed property to get the user document directory URL
    private var readingListURL: URL? {
        
        let fileManager = FileManager.default
        
        guard let document = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return document.appendingPathComponent("ReadingList.plist")
    }
    
    //MARK: - CRUD
    
    //Create
    func Create(title:String, reasonToRead:String)  {
        let book = Book(title: title, reasonToRead: title)
        books.append(book)
        saveToPersistentStore()
    }
    
    //delete data
    func delete(book: Book) {
        
        //look for the book in the array and then if found remove it
        if let index = books.firstIndex(of: book) {
            books.remove(at: index)
            //save leftover array
            saveToPersistentStore()
        }
        
    }
    
    //update Bool
    func updateHasBeenRead(for book: Book){
        
        //1.Find the index
        if let index = books.firstIndex(of: book) {
            //2.get the book at specific index
            var currentBook = books[index]
                //3.Update property
            currentBook.hasBeenRead = !currentBook.hasBeenRead
            //4.save leftover array
            saveToPersistentStore()
        }
    }
    
    
    //update Details
    func updateDetails(for book: Book){
        
        //1.Find the index
        if let index = books.firstIndex(of: book) {
            //2.get the book at specific index
            var currentBook = books[index]
                //3.Update property
            currentBook.title = book.title
            currentBook.reasonToRead = book.reasonToRead
            //4.save leftover array
            saveToPersistentStore()
        }
    }
    
    
    //MARK: - Persist and load
    
    
    
    //func to save data
    func saveToPersistentStore() {
        
        //Unwraping url
        guard let url = readingListURL else { return }
        
        do {
            //instance of encoder
            let encoder = PropertyListEncoder()
            
            //encode the new data
            let data = try encoder.encode(books)
            
            //finally write the data to the plist
            try data.write(to: url)
        } catch {
            print("Error while saving data: \(error)")
        }
    }
    
    //func to load current data to view
    func loadFromPersistentStore() {
        //navigate to URL
        let fileManager = FileManager.default
        
        //Unwrap options
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else { return }

        do {
            //gain access to the plist
            let data = try Data(contentsOf: url)
            
            //initialize method to decode plist
            let decodedBooks = PropertyListDecoder()
           
            //set the book array to the decoded data in the plist
            books = try decodedBooks.decode( [Book].self, from: data)
            
        } catch {
            print("Error while loading data: \(error)")
        }
    }
    
}
