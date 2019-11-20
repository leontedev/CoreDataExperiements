//
//  Movie+CoreDataProperties.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 19/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        return title ?? "Unknown Title"
    }
}
