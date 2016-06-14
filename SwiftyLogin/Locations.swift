//
//  Locations.swift
//  TryCalendarView
//
//  Created by Gaurav Gupta on 6/6/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//


// Locations of the obstacles.
class Locations {
    
    var title:String?
    var teams:[CustomCellData] = []
    
    init(title: String, teams: [CustomCellData]) {
        self.title = title
        self.teams = teams
    }
    
}