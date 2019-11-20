//
//  Kountry+CoreDataProperties.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 20/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//
//

import Foundation
import CoreData


extension Kountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kountry> {
        return NSFetchRequest<Kountry>(entityName: "Kountry")
    }

    @NSManaged public var shortName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var candy: NSSet?

    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }

    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    public var candyArray: [Kandy] {
        let set = candy as? Set<Kandy> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Kountry {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Kandy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Kandy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}
