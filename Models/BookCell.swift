//
//  BookCell.swift
//  libapp
//
//  Created by Emre Kunt on 9.12.2017.
//  Copyright © 2017 Emre Kunt. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var bookWriter: UILabel!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    func configureCell(book : Book){
        bookWriter.text = book.writer
        bookName.text = book.name
        let url = URL(string: book.image)!
        let data = try? Data(contentsOf: url)
        bookImage.image = UIImage(data: data!)
    }
    
}
