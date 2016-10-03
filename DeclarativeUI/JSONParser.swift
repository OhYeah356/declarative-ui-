//
//  JSONParser.swift
//  DeclarativeUI
//
//  Created by Jan Vrzal on 30.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import Foundation

class JSONParser {
    
    func parseJSONObject(JSONObject: [String : AnyObject]) -> SectionModel? {

		var componentsArray = [ComponentModel]()

		if let title = JSONObject["title"] as? String {
            
			if let components = JSONObject["components"] as? [[String: AnyObject]] {
				for component in components {
					if let type = component["type"] as? String {
						if let text = component["text"] as? String {
							let componentObject = ComponentModel(type: type, text: text)
                            componentsArray.append(componentObject)
						}
					}
				}
			}
            let section = SectionModel(title: title, component: componentsArray)
            return section
		}
		return nil
	}
}