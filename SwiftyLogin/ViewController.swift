//
//  ViewController.swift
//  TryCalendarView
//
//  Created by Gaurav Gupta on 6/6/16.
//  Copyright © 2016 Gaurav Gupta. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController, CAPSPageMenuDelegate, AuthProtocol {
    
//    let cellIdentifier = "Cell"
//    var tableView: UITableView  =   UITableView()
//    let animals : [String] = ["Dogs","Cats","Mice"]
    var pageMenu : CAPSPageMenu?
    var controllerArray : [UIViewController] = []

    var locations: [Locations] = [
        Locations(title:"Lane1", teams: [
            CustomCellData(dogName : "Bruno", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
            CustomCellData(dogName : "Rex", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
            CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
            CustomCellData(dogName : "Jack", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
            
            ]),
        Locations(title:"Lane2", teams: [
            CustomCellData(dogName : "Bruno2", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
            CustomCellData(dogName : "Rex2", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
            CustomCellData(dogName : "Jack2", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
            CustomCellData(dogName : "Jack2", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
            
            ]),
        Locations(title:"Lane3", teams: [
            CustomCellData(dogName : "Bruno3", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
            CustomCellData(dogName : "Rex3", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
            CustomCellData(dogName : "Jack3", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
            CustomCellData(dogName : "Jack3", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
            
            ]),
        Locations(title:"Lane4", teams: [
            CustomCellData(dogName : "Bruno4", handlerName: "Kyle", employer: "SOC", time: "08:00-10:00", status: "Not Completed"),
            CustomCellData(dogName : "Rex4", handlerName: "Mark", employer: "SOC", time: "08:00-10:00", status: "Completed"),
            CustomCellData(dogName : "Jack4", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed"),
            CustomCellData(dogName : "Jack4", handlerName: "Rob", employer: "SOC", time: "10:00-12:00", status: "Completed")
            
            ])
        
        
    ]

//    var locations = [
//        Locations(title:"Lane1", teams: [
//             Teams(handler: "Joe_L1", canine: "Rex", employer: "SOC"),
//             Teams(handler: "Bruce_L1", canine: "Can1", employer: "SOC"),
//             Teams(handler: "Joe_L1", canine: "Can1", employer: "SOC"),
//            ]),
//        Locations(title:"Lane2", teams: [
//            Teams(handler: "Joe_L2", canine: "Rex", employer: "SOC"),
//            Teams(handler: "Bruce_L2", canine: "Can1", employer: "SOC"),
//            Teams(handler: "Joe_L2", canine: "Can1", employer: "SOC"),
//            ]),
//        Locations(title:"Lane3", teams: [
//            Teams(handler: "Joe_L3", canine: "Rex", employer: "SOC"),
//            Teams(handler: "Bruce_L3", canine: "Can1", employer: "SOC"),
//            Teams(handler: "Joe_L3", canine: "Can1", employer: "SOC"),
//            ]),
//        Locations(title:"Lane4", teams: [
//            Teams(handler: "Joe_L4", canine: "Rex", employer: "SOC"),
//            Teams(handler: "Bruce_L4", canine: "Can1", employer: "SOC"),
//            Teams(handler: "Joe_L4", canine: "Can1", employer: "SOC"),
//            ])
//
//
//    ]

    //Mark - logout controls
    
    func success() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Login");
        
        
    }
    
    func error() {
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewcontroller viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
        self.customNavBarLayout()
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        for location in locations {
            let controller : MasterViewController = MasterViewController(nibName: "MasterViewController", bundle: nil)
            controller.title = location.title
            controller.teams = location.teams
            controllerArray.append(controller)
        }
        
        

        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor.whiteColor()),
            .SelectionIndicatorColor(UIColor.blueColor()),
            .UnselectedMenuItemLabelColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 0.4)),
//            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 35.0)!),
            .MenuHeight(44.0),
            .SelectionIndicatorHeight(0.0),
            .BottomMenuHairlineColor(UIColor.blueColor()),
            .MenuItemWidthBasedOnTitleTextWidth(true),
            .SelectedMenuItemLabelColor(UIColor.blueColor())        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 20.0, self.view.frame.width, self.view.frame.height - 20.0), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.delegate = self


        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark -- Layout Functions
    func customNavBarLayout() {
        print("customNav")
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.topItem?.title = "Welcome Gaurav"
//        self.navigationController?.navigationBar.tintColor = UIColor.lightGrayColor()
        self.addRightBarButtons()
        self.addLeftBarButtons()
        self.addBottomView()
        
        
    }
    
    func addRightBarButtons() {
        let logout = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(ViewController.logoutTapped))
        navigationItem.rightBarButtonItems = [logout]
    }
    
    func addLeftBarButtons() {
        //TODO
    }
    
    func addBottomView() {
    }
    
    func logoutTapped() {
        let loginService = LoginService();
        loginService.logout(self)
    }
    
    func willMoveToPage(controller: UIViewController, index: Int){
//        print("willMoveToPage \(index)")
        let masterController = controller as! MasterViewController
        masterController.willShowTableOnMaster()
    
    }
    
    func didMoveToPage(controller: UIViewController, index: Int){
        print("didMoveToPage \(index)")

    }

 
    
    


}

