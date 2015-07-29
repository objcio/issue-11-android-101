//
//  DataManager.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 6/14/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import Foundation

public class DataManager: NSObject {
	// MARK - Shared Instance
	public static let sharedInstance = DataManager()

	// MARK - Computed Properties
	public static var dataDateFormatter:NSDateFormatter {
		get {
			let dateFormatter = NSDateFormatter()
			dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
			dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
			dateFormatter.doesRelativeDateFormatting = true
			return dateFormatter
		}
	}

	private static var _backgroundQueue:dispatch_queue_t {
		get {
			return dispatch_queue_create("SubwayLineBackgroundQueue", DISPATCH_QUEUE_SERIAL)
		}
	}

	// MARK - Data Import

	public func importData(key:LineType, completion: ((tripList :TripList?, succeeded :Bool, error :NSError?) -> ())? ) {
		dispatch_async(DataManager._backgroundQueue) { () -> Void in
			do {
                let data = try self.parseJSONToDictionary(key.filename())
                let tripListData = data.objectForKey("TripList") as? NSDictionary
				let tripList = try TripList.parseData(tripListData!) // TODO: !

				if let completion = completion {
					dispatch_async(dispatch_get_main_queue(), { () -> Void in
						completion(tripList: tripList, succeeded: true, error: nil)
					})
				}
			} catch {
				if let completion = completion {
					dispatch_async(dispatch_get_main_queue(), { () -> Void in
						completion(tripList: nil, succeeded: false, error: nil) // TODO: error
					})
				}
			}
		}
	}

	private func parseJSONToDictionary(fileName: String) throws -> NSDictionary {
		guard let filePath:String = NSBundle.mainBundle().pathForResource(fileName.stringByDeletingPathExtension, ofType: fileName.pathExtension) else {
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: [
                    NSLocalizedDescriptionKey: NSLocalizedString("Could not find data file.", comment: "Read error description"),
                    NSLocalizedFailureReasonErrorKey: NSLocalizedString("TODO", comment: "Read failure reason")
                    ])
		}

		let jsonData = try NSData(contentsOfURL: NSURL(fileURLWithPath: filePath), options: NSDataReadingOptions.DataReadingMapped)
		let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary

		return jsonDict;
	}
}
