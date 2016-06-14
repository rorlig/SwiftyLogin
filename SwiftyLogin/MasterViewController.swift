//
//  MasterViewController.swift
//  TryCalendarView
//
//  Created by Gaurav Gupta on 6/6/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, TableViewDataProtocol {
    
    var tableView: UITableView  =   UITableView()
    let animals : [String] = ["Dogs","Cats","Mice"]
    let cellIdentifier = "teamcell"
    var teams:[CustomCellData] = []
//    var cellDataArray: [Locations] = [
//        Locations(title:"Lane1", teams: [
//            CustomCellData(dogName : "Bruno", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
//            CustomCellData(dogName : "Rex", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
//            CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
//            CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//
//            ]),
//        Locations(title:"Lane2", teams: [
//            CustomCellData(dogName : "Bruno2", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
//            CustomCellData(dogName : "Rex2", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
//            CustomCellData(dogName : "Jack2", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
//            CustomCellData(dogName : "Jack2", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//            
//            ]),
//        Locations(title:"Lane3", teams: [
//            CustomCellData(dogName : "Bruno3", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
//            CustomCellData(dogName : "Rex3", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
//            CustomCellData(dogName : "Jack3", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
//            CustomCellData(dogName : "Jack3", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//            
//            ]),
//        Locations(title:"Lane4", teams: [
//            CustomCellData(dogName : "Bruno4", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
//            CustomCellData(dogName : "Rex4", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
//            CustomCellData(dogName : "Jack4", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
//            CustomCellData(dogName : "Jack4", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//            
//            ])
//        
//        
//    ]
    
    var index:Int = 0



    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        print("viewDidLoad \(teams.count)")
        
        self.addBottomView()
    }
    
    func addBottomView() {
        let screenSize = UIScreen.mainScreen().bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width/2
        
        tableView = UITableView(frame: (CGRectMake(0, 0, screenWidth, screenHeight)), style: UITableViewStyle.Plain)
//        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
//        let nib = UINib(nibName: "TeamsTableViewCell", bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
       
        
        tableView.registerNib(UINib(nibName:"CustomCell", bundle:nil), forCellReuseIdentifier: "custom_cell")
        initCustomCellDataArray()
        tableView.dataSource = self
        tableView.delegate = self
        

//        tableView.estimatedRowHeight = 208;
        tableView.rowHeight = 164;
        view.addSubview(tableView)
    }
    
    //Mark -- TableView Datasource Method
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count \(self.teams.count)")
        return teams.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("custom_cell", forIndexPath: indexPath) as! CustomCell
        let cellData = self.teams[indexPath.row]
        cell.updateUIOfCell(cellData)
        return cell

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return CGFloat(CustomCell.height())
    }

    
    
    
    //Mark -- TableView Delegate Method
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
//        print(animals[indexPath.row])
    }
    
    //Mark -- TableViewData Protocol
    func didShowTableOnMaster() {
        print("didShowTableOnMaster")
    }
    
    
    //Mark -- Initialization Data
    
    
    func initCustomCellDataArray() {
//        var cellData = CustomCellData(dogName : "Bruno", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed")
//        cellDataArray.append(cellData)
//        cellData = CustomCellData(dogName : "Rex", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed")
//        cellDataArray.append(cellData)
//        cellData = CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//        cellDataArray.append(cellData)
//        cellData = CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
//        cellDataArray.append(cellData)
    }
    
    
    
    func willShowTableOnMaster() {
        print("willShowTableOnMaster \(index)")
//        self.teams = teams;
        self.tableView.reloadData()
//        print("teams count \(teams.count)")
    }
    
    
    
    
    
}



