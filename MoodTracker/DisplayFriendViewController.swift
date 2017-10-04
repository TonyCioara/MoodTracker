//
//  DisplayFriendViewController.swift
//  MoodTracker
//
//  Created by Tony Cioara on 10/2/17.
//  Copyright © 2017 Tony Cioara. All rights reserved.
//

import UIKit

class DisplayFriendViewController: UIViewController {
    
    @IBOutlet weak var friendNameField: UITextField!
    @IBOutlet weak var moodController: UISegmentedControl!
    @IBOutlet weak var deleteButton: UIButton!
    var delegate: moodTrackerDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preapre called")
        if let identifier = segue.identifier {
            if identifier == "cancelSegue" {
            } else {
                let friend = Friend(name: friendNameField.text!, mood: moodController.titleForSegment(at: moodController.selectedSegmentIndex)!)
                if identifier == "deleteSegue" {
                    friend.name = ""
                }
                delegate?.passPerson(person: friend)
            }
        }
    }
}
