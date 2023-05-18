//
//  UserViewModel.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 18/05/23.
//

import Foundation
import CoreData
import UIKit

class UserViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    
    @Published var companyArray: [User] = []
    
    init() {
        fetchUserData()
    }
    
    func fetchUserData() {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            companyArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addUserName(userName: String) {
        let user = User(context: viewContext)
        user.firstName = userName
        save()
        self.fetchUserData()
    }
    
    func addPhone(phone: String) {
        let user = User(context: viewContext)
        user.phone = phone
        save()
        self.fetchUserData()
    }
    
    func addImage(image: Data) {
        let user = User(context: viewContext)
        user.image = image
        save()
        self.fetchUserData()
    }
    
    func addLocation(created: String, updated: String) {
        let user = User(context: viewContext)
        user.createdLocation = created
        user.updatedLocation = updated
        save()
        self.fetchUserData()
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch {
            print("Error saving")
        }
    }
}
