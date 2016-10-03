//
//  SectionData
//  DeclarativeUI
//
//  Created by Jan Vrzal on 02.10.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class SectionData {
    
    private let service = Service(fileName: "ComponentsConfig", fileType: "txt")
    private let parser = JSONParser()
    
    func getSection() -> SectionModel?{
        
        guard let data = service.getJSONData() else {
            return nil
        }
        guard let section = parser.parseJSONObject(data) else {
            return nil
        }
        return section
    }
    
    func getTitle() -> String{
        return getSection()!.title!
    }
    
    func getComponents() -> [ComponentModel]{
        return getSection()!.component
    }
    
    
}
