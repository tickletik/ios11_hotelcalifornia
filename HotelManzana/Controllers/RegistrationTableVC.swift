//
//  RegistrationTableVC.swift
//  HotelManzana
//
//  Created by ronny abraham on 12/13/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegistrationTableVC: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: NSLayoutConstraint!
    
    
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        updateDateViews()
        updateNumberOfGuests()
    }

    func updateDateViews() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    func updateNumberOfGuests() {
        
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch(indexPath.section, indexPath.row) {
            
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row):
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0
            }
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row):
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0
            }
            
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch(indexPath.section, indexPath.row) {
            
            
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row - 1):
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }
            else {
                isCheckInDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = true
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }
            else {
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
            
        default:
            break
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        let numberOfAdults = numberOfAdultsLabel.text ?? ""
        let numberOfChildren = numberOfChildrenLabel.text ?? ""
        
        print("first name: \(firstName)")
        print("last name: \(lastName)")
        print("email: \(email)")
        
        print("check in date: \(checkInDate)")
        print("check out date: \(checkOutDate)")
        
        print("number of adults: \(numberOfAdults)")
        print("number of children: \(numberOfChildren)")
        
        print("wifi on/off: \(wifiSwitch.isActive)")
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        updateDateViews()
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchAction(_ sender: UISwitch) {
    }
    
}
