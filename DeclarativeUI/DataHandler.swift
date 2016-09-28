//
//  DataHandler.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 28.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//
import Foundation

class DataHandler {

	var mainTitle: String?
    var components = [Component]()

	// Get JSON from txt. file
	func getJSONData(){

		let bundle = NSBundle.mainBundle()
		let fileName = "ComponentsConfig"

		guard let path = bundle.pathForResource(fileName, ofType: "txt") else {
			print("There is no file named: \(fileName)")
			return
		}
		guard let jsonData = NSData(contentsOfFile: path) else {
			return
		}
		do {
			let object = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
			if let dictionary = object as? [String: AnyObject] {
                components = readJSONObject(dictionary)
			}
		} catch {
			print("error serializing JSON \(error)")
		}
		
	}

	// Creating component array from JSON
	private func readJSONObject(object: [String: AnyObject]) -> [Component] {

		var index = -1
		var componentsArray = [Component]()

		if let title = object["title"] as? String {
			mainTitle = title
			if let components = object["components"] as? [[String: AnyObject]] {
				for component in components {
					if let type = component["type"] as? String {
						if let text = component["text"] as? String {
							index += 1
							let componentObject = Component(type: type, text: text, indexPath: index)
							componentsArray.append(componentObject)
						}
					}
				}
			}
		}
		return componentsArray
	}
}
