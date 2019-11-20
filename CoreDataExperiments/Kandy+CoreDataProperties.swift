//
//  Kandy+CoreDataProperties.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 20/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//
//

import Foundation
import CoreData


extension Kandy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kandy> {
        return NSFetchRequest<Kandy>(entityName: "Kandy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Kountry?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
