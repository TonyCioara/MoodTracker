//
//  MoodTrackerTableViewController.swift
//  MoodTracker
//
//  Created by Tony Cioara on 9/28/17.
//  Copyright © 2017 Tony Cioara. All rights reserved.
//

import UIKit

class MoodTrackerTableViewController: UITableViewController, moodTrackerDelegate {

    var rowNumber = -1
    
    var friends = [Friend]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            // set delegate on displayfriend vc
            let vc = segue.destination as! DisplayFriendViewController
            vc.delegate = self
            if identifier == "displayFriend" {
                
                
                
                rowNumber = tableView.indexPathForSelectedRow!.row
                print(rowNumber)
                
            } else if identifier == "addFriend" {
                
                rowNumber = -1
            }
        }
    }
    
    func passPerson(person: Friend) {
        if rowNumber == -1 {
            addPerson(person: person)
        } else {
            editPerson(person: person, row: rowNumber)
        }
    }
    
    func addPerson(person: Friend) {
        print("ADD")
        if person.name != "" {
            friends.append(person)
        }
    }
    func editPerson(person: Friend, row: Int) {
        print("EDIT")
        friends[row] = person
        
        if friends[row].name == "" {
            if friends.count > 1 {
                for i in row...friends.count - 2 {
                    friends[i] = friends[i + 1]
                }
            }
            friends.remove(at: friends.count - 1)
        }
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodTrackerTableViewCell", for: indexPath) as! MoodTrackerTableViewCell
        
        let row = indexPath.row
        
        let friend = friends[row]
        
        cell.friendNameLabel.text = friend.name
        
        cell.moodLabel.text = friend.mood
        
        return cell
    }
}
