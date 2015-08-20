//
//  TripDetailViewController.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 7/27/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import UIKit

public class TripDetailViewController : UITableViewController {
    
	@IBOutlet weak var tripDetailHeaderView: TripDetailHeaderView!
    var trip:Trip?
    
    public func prepareWithTrip(trip:Trip) {
        self.trip = trip
    }

	// MARK - View Lifecycle
    
    public override func viewDidLoad() {
        self.title = trip?.destination
		if let trip = self.trip {
			self.tripDetailHeaderView.updateHeader(trip)
		}
    }

	// MARK - UITableViewDataSource
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataCount = self.trip?.predictions?.count else {
            return 0
        }
        return dataCount
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("TripPredictionTableViewCell", forIndexPath: indexPath)
        
        if let prediction = self.trip?.predictions?[indexPath.row] {
            cell.textLabel?.text = prediction.stopName
            cell.detailTextLabel?.text = String(prediction.stopSeconds / 60) + " m"
        }
        
        return cell;
    }

	// MARK - UITableViewDelegate

	public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
}