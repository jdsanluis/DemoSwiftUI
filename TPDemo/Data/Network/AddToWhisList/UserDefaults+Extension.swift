//
//  UserDefaults+Extension.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

extension UserDefaults {
    
    enum Keys {
        static let myKey = "WhistList"
    }
    
    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }
}
