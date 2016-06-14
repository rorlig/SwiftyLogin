//
//  CustomCell.swift
//  TableView-Swift
//
//  Created by Pavan Goyal on 6/11/16.
//  Copyright © 2016 Pavan Goyal. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var dogFirstLetterLabel: UILabel!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dogAndHandlerLabel: UILabel!
    @IBOutlet weak var employerLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    private func setUp() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.circularView.layer.cornerRadius = self.circularView.frame.size.width/2
        self.circularView.clipsToBounds = true
        self.circularView.layer.borderColor = UIColor.blackColor().CGColor
        self.circularView.layer.borderWidth = 1.0
    }
    
    func updateUIOfCell(cellData: CustomCellData) {
        self.timeLabel.text = cellData.time
        self.statusLabel.text = cellData.status
        self.dogAndHandlerLabel.text = "\(cellData.dogName) (C) & \(cellData.handlerName) (H)"
        self.employerLabel.text = "Employer: \(cellData.employer)"
        if let firstLetter = cellData.dogName.characters.first {
            self.dogFirstLetterLabel.text = "\(firstLetter)"
        }
    }
    
    static func height() -> Float {
        return 154
    }

}
