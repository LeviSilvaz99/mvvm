//
//  Parser.swift
//  mvvm
//
//  Created by André Levi Oliveira Silva on 11/05/22.
//

import Foundation

struct Parser {
    
    func getParse(completed: @escaping ([Contact]) -> ()) {
        
        let api = URL(string: "https://api.androidhive.info/contacts/")
        
        URLSession.shared.dataTask(with: api!) { (data, response, error) in
            
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(Welcome.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed(result.contacts)
                    }
                } catch {
                    print("JSON ERROR")
                }
            }
        }.resume()
    }
    
}
