//
//  ProjectRepository.swift
//  Doxy
//
//  Created by Bubele Booi on 12/13/22.
//
import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ProjectViewModel: ObservableObject {
   // @Published var projects: [Project] = []
    @Published var object: ObjectDemo? = nil
    @Published
    var listObject = [ObjectDemo]()
    var ref = Database.database().reference()
    
    func readObject() {
        ref.child("Sheet 1").child("Page 1").child("0")
            .observe(.value) { snapshot in
            do{
                self.object = try snapshot.data(as: ObjectDemo.self)
            }catch{
                print("Cannot convert to objectDemo")
            }
        }
    }
    
    func observeListOject() {
        ref.child("Sheet 1").child("Page 1")
            .observe(.value){ parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            self.listObject = children.compactMap({ snapshot in
                return try? snapshot.data(as: ObjectDemo.self)
            })
            
        }
    }
    
}
