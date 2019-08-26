//
//  Models.swift
//  SortingSampleApp
//
//  Created by Tomas Cejka on 8/26/19.
//  Copyright © 2019 STRV. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var name: String

    init() {
        id = UUID().uuidString
        name = Randomize.randomName()
    }
}

struct Message {
    var user: User
    var date: Int
    var message: String

    init(user: User) {
        date  = Randomize.randomDate()
        self.user = user
        message = " Lorem ipsum from user \(user.name) from date \(date)"
    }

    // Super slowly data preparation :-D first version
    static func randomMessages() -> [Message] {
        var messages: [Message] = []
        for _ in 1...10000 {
            messages.append(Message(user: User()))
        }

        return messages
    }
}

private final class Randomize {
    // MARK: - Helper random functions
    class func randomDate()-> Int {
        // safe day :-D
        let day = Int.random(in: 1...28)
        let month = Int.random(in: 1...12)

        let dateComponents = DateComponents(calendar: Calendar.current,
                                            year: 2018,
                                            month: month,
                                            day: day)
        return Int(dateComponents.date?.timeIntervalSince1970 ?? Date().timeIntervalSince1970)
    }

        // MARK: - Helper random functions
        class func randomName() -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var name: String = ""
        let nameLength = Int.random(in: 3..<10)
        for n in 1...nameLength {
            name.append(charSet.randomElement() ?? " ")
        }
        return name
    }
}
