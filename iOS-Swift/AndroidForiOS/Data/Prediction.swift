//
//  Prediction.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 6/14/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import Foundation

public struct Prediction {
    public var stopId:String = ""
    public var stopName:String = ""
    public var stopSeconds:NSInteger = 0
    
    public static func parseData(data: NSDictionary) -> Prediction {
        var importedPrediction:Prediction = Prediction()
        guard let stopId = data.objectForKey("StopID") as? String else {
            return importedPrediction  // TODO: throw
        }
        importedPrediction.stopId = stopId
        
        if let stopName = data.objectForKey("Stop") as? String  {
            importedPrediction.stopName = stopName
        }
        if let stopSeconds = data.objectForKey("Seconds") as? NSNumber {
            importedPrediction.stopSeconds = stopSeconds.integerValue
        }
        
        return importedPrediction        
    }
}
