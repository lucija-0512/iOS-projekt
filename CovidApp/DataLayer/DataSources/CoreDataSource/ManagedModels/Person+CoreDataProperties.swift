//
//  Person+CoreDataProperties.swift
//  
//
//  Created by five on 02/07/2021.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var oib: String
    @NSManaged public var birthDate: Date

}
