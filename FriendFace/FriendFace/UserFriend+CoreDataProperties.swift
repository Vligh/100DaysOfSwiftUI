//
//  UserFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 22.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//
//

import Foundation
import CoreData


extension UserFriend {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<UserFriend> {
    return NSFetchRequest<UserFriend>(entityName: "UserFriend")
  }
  
  @NSManaged public var friendId: UUID?
  @NSManaged public var userId: UUID?
  @NSManaged public var users: UserMO?
  
}
