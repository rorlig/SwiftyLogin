//
//  CustomCellData.swift
//  TableView-Swift
//
//  Created by Pavan Goyal on 6/11/16.
//  Copyright © 2016 Pavan Goyal. All rights reserved.
//

import Foundation

class CustomCellData {
    let dogName: String
    let handlerName: String
    let employer: String
    let time: String
    let status: String

    init(dogName: String, handlerName: String, employer: String, time: String, status: String) {
        self.dogName = dogName
        self.handlerName = handlerName
        self.employer = employer
        self.time = time
        self.status = status
    }

}
