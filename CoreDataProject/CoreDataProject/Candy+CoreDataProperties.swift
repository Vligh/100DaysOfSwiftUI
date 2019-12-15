//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Vitali Tatarintev on 15.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

  @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
    return NSFetchRequest<Candy>(entityName: "Candy")
  }

  @NSManaged public var name: String?
  @NSManaged public var origin: Country?

  public var wrappedName: String {
    name ?? "Unknown Candy"
  }
}
