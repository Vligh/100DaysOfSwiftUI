//
//  UserMO+CoreDataProperties.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 23.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//
//

import Foundation
import CoreData


extension UserMO {

  @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
    return NSFetchRequest<UserMO>(entityName: "User")
  }

  @NSManaged public var about: String?
  @NSManaged public var address: String?
  @NSManaged public var age: Int16
  @NSManaged public var company: String?
  @NSManaged public var email: String?
  @NSManaged public var id: UUID?
  @NSManaged public var isActive: Bool
  @NSManaged public var name: String?
  @NSManaged public var registered: Date?
  @NSManaged public var tags: [String]?
  @NSManaged public var friendIds: [UUID]?

}
