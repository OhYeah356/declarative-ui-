//
//  Service.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 30.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import Foundation

class Service{
    
    private let bundle = NSBundle.mainBundle()
    
    let fileName: String
    let fileType: String
    
    init(fileName: String, fileType: String){
        self.fileName = fileName
        self.fileType = fileType
    }
    
    // Get JSON from txt. file
    func getJSONData() -> [String: AnyObject]?{
        
        guard let path = bundle.pathForResource(fileName, ofType: fileType) else {
            print("There is no file named: \(fileName) of Type: \(fileType)")
            return nil
        }
        guard let jsonData = NSData(contentsOfFile: path) else {
            print("Cant convert content of file")
            return nil
        }
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                return dictionary
            }
        } catch {
            print("\(error)")
        }
        return nil
    }
}