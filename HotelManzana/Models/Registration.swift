//
//  Registration.swift
//  HotelManzana
//
//  Created by ronny abraham on 12/13/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    
    var price: Int
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 159),
            RoomType(id: 1, name: "Motorcycle Man Room", shortName: "mmr", price: 216),
            RoomType(id: 2, name: "Pink Lady", shortName: "PL", price: 328)]
    }
}

// Equatable Protocol Implementation for RoomType

func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}
