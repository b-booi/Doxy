//
//  Project.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct Project : Identifiable, Decodable {
    var id : String = UUID().uuidString
    var Title : String
    var Artist : String
    var fee : Double
    var Paid : Bool
}

#if DEBUG
let testDataProjects = [
    
    Project(id: "1", Title: "If You Let Me Go", Artist: "Rei Brown", fee: 1500, Paid: true),
    Project(id: "2", Title: "Neptune", Artist: "Rei Brown", fee: 1500, Paid: true),
    Project(id: "3", Title: "Worst Thing ft Kenzie", Artist: "NOTD", fee: 4991, Paid: true),
    Project(id: "4", Title: "Last Call", Artist: "Will Linley", fee: 16000, Paid: false),
    Project(id: "5", Title: "all the girls", Artist: "Will Linley", fee: 5000, Paid: true),
    Project(id: "6", Title: "i dont wanna be yours", Artist: "Will Linley", fee: 5000, Paid: true),
    Project(id: "7", Title: "kill all my feelings", Artist: "Will Linley", fee: 2500, Paid: true),
    Project(id: "8", Title: "miss me (when you're gone) - [sad version][Acoustic]", Artist: "Will Linley", fee: 2000, Paid: true),
    
]
#endif
