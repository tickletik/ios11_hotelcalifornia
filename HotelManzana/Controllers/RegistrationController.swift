//
//  RegistrationController.swift
//  HotelManzana
//
//  Created by ronny abraham on 12/18/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegistrationController: UITableViewController {
    
    var registrations: [Registration] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)

        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name
        
        return cell
    }

    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationSegue = unwindSegue.source as? AddRegistrationTableVC,
            let registration = addRegistrationSegue.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
    }

}
