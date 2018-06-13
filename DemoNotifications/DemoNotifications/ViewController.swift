//
//  ViewController.swift
//  DemoNotifications
//
//  Created by Macbook Air on 13/06/2018.
//  Copyright © 2018 saurabh. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createAndScheduleNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAndScheduleNotification() {
        // content
        let content = UNMutableNotificationContent()
        content.title = "Invitation"
        content.subtitle = "This is local notification"
        content.body = "You are invited"
        content.categoryIdentifier = "INVITATION"
        content.sound = UNNotificationSound.default()
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // request
        let request = UNNotificationRequest(identifier: "Birthday", content: content, trigger: trigger)
        
        // schedule
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

