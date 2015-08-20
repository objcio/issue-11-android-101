//
//  SubwayListViewController.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 6/14/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import UIKit

class SubwayListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK - Properties and Static Values
    
    @IBOutlet weak var tableView: UITableView!
    
    static let aboutMessage = NSLocalizedString("This application demonstrates the correlation between iOS and Android development using Subway data provided by the MBTA.",
        comment: "Description for hello world message")
    
    var data:[LineType]?
    
    // MARK - View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        self.clearColorStyles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = [LineType.Red, LineType.Blue, LineType.Orange]
    }
    
    // MARK - UITableViewDataSource

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataCount = self.data?.count else {
            return 0
        }
        return dataCount
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("SubwayLineCell", forIndexPath: indexPath)

        if let data = self.data {
            var subwayLineType = data[indexPath.row]
            cell.textLabel?.text = subwayLineType.rawValue
            cell.textLabel?.textColor = subwayLineType.color()            
        }
        
        return cell;
	}
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tripVC = segue.destinationViewController as? TripListTableViewController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row, data = self.data {
				tripVC.prepareForSubwayLine(data[selectedIndex])
            }
        }
    }
    
    // MARK - Actions

    @IBAction func didPressHelloWorldButton(sender: AnyObject) {
        self.presentViewController(
            SubwayListViewController.aboutAlertControllerWithTitle(NSLocalizedString("Hello World", comment: "Hello World Alert Title")), animated: true, completion: nil)
    }
    
    @IBAction func didPressAboutButton(sender: AnyObject) {
        self.presentViewController(SubwayListViewController.aboutAlertControllerWithTitle(NSLocalizedString("About", comment: "About App Title")), animated: true, completion: nil)
    }
    
    static func aboutAlertControllerWithTitle(title:String) -> UIAlertController {
        let alertController = UIAlertController( title: title, message:SubwayListViewController.aboutMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK for dismissal"), style: UIAlertActionStyle.Cancel, handler: nil))
        return alertController
    }
}
