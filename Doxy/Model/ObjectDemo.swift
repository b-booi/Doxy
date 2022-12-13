//
//  ObjectDemo.swift
//  Doxy
//
//  Created by Bubele Booi on 12/13/22.
//

import Foundation

class ObjectDemo: Encodable, Decodable, Identifiable {
    var Artist: String = ""
    var Fee: Double = 0
    var ID : String = ""
    var InvoiceStatus: String = "Pending"
    var PaymentStatus: String = "Pendng"
    var Points: Double = 0
    var SignedDeal: String = "Pending"
    var Song: String = ""
    
    
}

extension Encodable {
    
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self)else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
    
}

//extension ObjectDemo: Equatable {}
//
//func ==(lhs: ObjectDemo, rhs: ObjectDemo) -> Bool {
//    let areEqual = lhs.id == rhs.id &&
//        lhs.Song == rhs.Song
//
//    return areEqual
//}
