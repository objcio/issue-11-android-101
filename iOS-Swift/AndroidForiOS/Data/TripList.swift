//
//  TripList.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 6/14/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import Foundation
import UIKit

public enum LineType: String {
	case Red, Blue, Orange

	public func filename() -> String {
		return self.rawValue + ".json"
	}
    
    public func color() -> UIColor {
        switch (self) {
        case .Red:
            return UIColor.redColor()
        case .Blue:
            return UIColor.blueColor()
        case .Orange:
            return UIColor.orangeColor()
        }
    }
}

public struct TripList {

	public var currentTime:NSDate
	public var subwayLine:LineType
	public var trips:[Trip]

	// MARK: Helper Methods

	public static func parseData(data: NSDictionary) throws -> TripList {
		var currentTime: NSDate, subwayLine: LineType, trips: [Trip];

		// Import Current Time
		if let timeInterval:NSTimeInterval = data.objectForKey("CurrentTime") as? NSTimeInterval {
			currentTime = NSDate(timeIntervalSince1970: timeInterval)
		} else {
			throw parseError("Data had invalid time interval formatting")
		}

		// Import Subway Line Type
		if let subwayLineValue:String = data.objectForKey("Line") as? String {
//			do {
//				try subwayLine = LineType(rawValue: subwayLineValue)!
//			} catch {
//				throw parseError("Subway line type not recognized")
//			}
            subwayLine = LineType(rawValue: subwayLineValue)!
		} else {
			throw parseError("Subway line type data malformed")
		}

		// Import Trips List
		if let tripData:[NSDictionary] = data.objectForKey("Trips") as? [NSDictionary] {
//            var importedTrips:
//            for trip in tripData.enumerate() {
//                
//            }
//            tripData.flatMap({ (NSDictionary) -> T? in
//                return Trip.parse
//            })
            trips = tripData.map({ (data:NSDictionary) -> Trip in
                return Trip.parseData(data)
            })
		} else {
			throw parseError("Subway line type data malformed")
		}


		return TripList(currentTime: currentTime, subwayLine: subwayLine, trips: trips)
	}

	static func parseError(failureReason: String) -> NSError {
		return NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: [
			NSLocalizedDescriptionKey: NSLocalizedString("Could not read trip list data.", comment: "Read error description"),
			NSLocalizedFailureReasonErrorKey: NSLocalizedString(failureReason, comment: "Read failure reason")
			])
	}
}