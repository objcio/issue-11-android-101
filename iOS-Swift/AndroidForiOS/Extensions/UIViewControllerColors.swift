//
//  UIViewControllerColors.swift
//  AndroidForiOS
//
//  Created by Stephen Barnes on 7/27/15.
//  Copyright © 2015 Stephen Barnes. All rights reserved.
//

import UIKit

extension UIViewController {
    func clearColorStyles() {
        self.navigationController?.navigationBar.barTintColor = nil
        self.navigationController?.navigationBar.tintColor = nil
        self.navigationController?.navigationBar.titleTextAttributes = nil
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
        self.navigationItem.rightBarButtonItem?.tintColor = nil;
        self.navigationItem.backBarButtonItem?.tintColor = nil;
    }
    
    func configureNavBarForLineType(lineType:LineType) {
        self.navigationController?.navigationBar.barTintColor = lineType.color()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
    }
}
