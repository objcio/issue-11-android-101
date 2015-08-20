//
//  SubwayTripTableViewCell.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 7/27/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import UIKit

class SubwayTripTableViewCell : UITableViewCell {
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var trainNameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    func updateCell(trip:Trip) {
        self.destinationLabel.text = trip.destination
        self.trainNameLabel.text = trip.trainName
        
        if let positionTimeStamp = trip.positionTimeStamp {
            self.timestampLabel.text = DataManager.dataDateFormatter.stringFromDate(positionTimeStamp)
        } else {
            self.timestampLabel.text = nil
        }
    }
}
