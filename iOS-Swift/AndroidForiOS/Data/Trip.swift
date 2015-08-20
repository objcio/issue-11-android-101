//
//  Trip.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 6/14/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import Foundation

public struct Trip {
    public var tripId:String = ""
    public var destination:String = ""
    public var positionTimeStamp:NSDate?
    public var trainName:String = ""
    public var positionLat:Double = 0.0
    public var positionLong:Double = 0.0
    public var positionHeading:NSInteger = 0
    public var predictions:[Prediction]?
    
    // TODO: Protocol for parsing data
    // TODO: thowing errors in a map
    
    public static func parseData(data: NSDictionary) -> Trip {
        var importedTrip:Trip = Trip()

        // Import TripId
        guard let tripId = data.objectForKey("TripID") as? String else {
            return importedTrip
//          throw parseError("Invalid TripId")
        }
        importedTrip.tripId = tripId
        
        guard let destination = data.objectForKey("Destination") as? String else {
            return importedTrip  // TODO: throw
//          throw parseError("invalid destination data")
        }
        importedTrip.destination = destination
        
        // Import Prediction List
        if let predictionData = data.objectForKey("Predictions") as? [NSDictionary] {
            importedTrip.predictions = predictionData.map({ (data:NSDictionary) -> Prediction in
                return Prediction.parseData(data)
            })
        }
        
        // Import position information if it exits
        if let positionData = data.objectForKey("Position") as? NSDictionary {
            if let timestamp = positionData.objectForKey("Timestamp") as? NSNumber {
                importedTrip.positionTimeStamp = NSDate(timeIntervalSince1970: timestamp.doubleValue)
            }
            if let trainName = positionData.objectForKey("Train") as? String {
                importedTrip.trainName = trainName
            }
            if let positionLatitude = positionData.objectForKey("Lat") as? NSNumber {
                importedTrip.positionLat = positionLatitude.doubleValue
            }
            if let positionLongitude = positionData.objectForKey("Long") as? NSNumber {
                importedTrip.positionLong = positionLongitude.doubleValue
            }
            if let heading = positionData.objectForKey("Heading") as? NSNumber {
                importedTrip.positionHeading = heading.integerValue
            }
        }
        
        return importedTrip
    }
    
    static func parseError(failureReason: String) -> NSError {
        return NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: [
            NSLocalizedDescriptionKey: NSLocalizedString("Could not read trip data.", comment: "Read error description"),
            NSLocalizedFailureReasonErrorKey: NSLocalizedString(failureReason, comment: "Read failure reason")
            ])
    }
}