//
//  CoreDataHandler.swift
//  CoreDataApp
//
//  Created by Bruno Lopes de Mello on 15/02/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    
    /// Basic configuration for the core date works
    ///
    /// - Returns: returns the Core Data
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    /// Save an object of type User
    ///
    /// - Parameters:
    ///   - username: The username of the User
    ///   - password: The password of the User
    /// - Returns: true or false depending what happens
    class func saveObject(username: String, password: String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue(username, forKey: "username")
        manageObject.setValue(password, forKey: "password")
        
        do {
            try context.save()
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    
    /// fetch an array of elements from an object
    ///
    /// - Returns: returns an array of User
    class func fetchObject() -> [User]? {
        let context = getContext()
        var user: [User]? = nil
        
        do {
            user = try context.fetch(User.fetchRequest())
            return user
        } catch let error {
            print(error.localizedDescription)
            return user
        }
    }
    
    
    /// Responsible for the elimination of a User Object
    ///
    /// - Parameter user: User that is going to be deleted
    /// - Returns: true or false depending what happens
    class func deleteObject(user: User) -> Bool {
        let context = getContext()
        context.delete(user)
        
        do {
            try context.save()
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    
    /// Deletes every object in the core
    ///
    /// - Returns: true or false depending what happens
    class func cleanDelete() -> Bool {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: User.fetchRequest())
        
        do {
            try context.execute(delete)
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    class func filterData() -> [User]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        var user: [User]? = nil
        
        var predicate = NSPredicate(format: "username contains[c] %@", "Br")
        fetchRequest.predicate = predicate
        
        do {
            user = try context.fetch(fetchRequest)
            return user
        } catch let error {
            print(error.localizedDescription)
            return user
        }
    }

}
