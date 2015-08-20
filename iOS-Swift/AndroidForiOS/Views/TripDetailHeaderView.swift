//
//  TripDetailHeaderView.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 7/28/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import UIKit

public class TripDetailHeaderView : UIView {
	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var latitudeLabel: UILabel!
	@IBOutlet weak var longitudeLabel: UILabel!
	@IBOutlet weak var headingLabel: UILabel!

	func updateHeader(trip:Trip) {
		self.destinationLabel.text = trip.destination
		self.latitudeLabel.text = String(format: "%.2lf", trip.positionLat)
		self.longitudeLabel.text = String(format: "%.2lf", trip.positionLong)
		self.headingLabel.text = String(trip.positionHeading)
	}
}
