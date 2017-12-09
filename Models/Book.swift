//
//  Book.swift
//  libapp
//
//  Created by Emre Kunt on 9.12.2017.
//  Copyright © 2017 Emre Kunt. All rights reserved.
//

import Foundation

class Book{
    var m_id: Int!
    var m_image : String!
    var m_name: String!
    var m_url: String!
    var m_writer: String!
    
    var id: Int{
        if m_id == nil{
            m_id = 0
        }
        return m_id
    }
    
    var image: String{
        if m_image == nil{
            m_image = ""
        }
        return m_image
    }
    var name: String{
        if m_name == nil{
            m_name = ""
        }
        return m_name
    }
    var url: String{
        if m_url == nil{
            m_url = ""
        }
        return m_url
    }
    var writer: String{
        if m_writer == nil{
            m_writer = ""
        }
        return m_writer
    }
    
    init(dict: Dictionary<String, AnyObject>){
        if let id = dict["id"] as? Int{
            self.m_id = id
        }
        
        if let image = dict["image"] as? String{
            self.m_image = image
        }
        
        if let name = dict["name"] as? String{
            self.m_name = name
        }
        if let url = dict["url"] as? String{
            self.m_url = url
        }
        if let writer = dict["writer"] as? String{
            self.m_writer = writer
        }
    }
    
    
}
