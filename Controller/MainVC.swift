//
//  MainVC.swift
//  libapp
//
//  Created by Emre Kunt on 9.12.2017.
//  Copyright © 2017 Emre Kunt. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITableViewDelegate,
UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        downloadBookDetails {
            
        }
  }
    
    func downloadBookDetails(completed: DownloadCompleted){
        let url = URL(string: WEBSERVICE_URL)!
        Alamofire.request(url).responseJSON{ response in
            let result = response.result
            if let dicBook = result.value as? [Dictionary<String, AnyObject>]{
                for obj in dicBook{
                    let book = Book(dict: obj)
                    self.books.append(book)
                }
            }
            self.tableView.reloadData()
            
        }
        completed()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookCell{
            cell.configureCell(book: books[indexPath.row])
            return cell
        }else{
            return BookCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: books[indexPath.row].url){
            UIApplication.shared.openURL(url)
        }
        
    }
    
    

    
    
    
}
