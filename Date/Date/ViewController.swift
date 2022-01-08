//
//  ViewController.swift
//  Date
//
//  Created by Macbook Air on 8.01.2022.
//

import UIKit

class ViewController: UIViewController {
    //variables for data

    let datePicker = UIDatePicker()
    var dateField = ""
    var yearField = 0
    var dayField = 0
    var montField = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //calling functions
        getChangeFormat()
        getYear()
        getDay()
        getMont()
    }
    


    @IBAction func datePickerSelected(_ sender: UIDatePicker) {
        //We print our data
        print(dateField)
        print(yearField)
        print(montField)
        print(dayField)
    }
}

extension ViewController   {
    
    
    //We change the format and pass it to our variable.
    func getChangeFormat() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd<>MM<>yyyy"
        dateField = formatter.string(from: datePicker.date)
        
    }
    //We pass on the year information.
    func getYear() {
        let calendar = Calendar.current
        yearField = calendar.component(Calendar.Component.year, from: datePicker.date)
    }
    //We pass on the day information.

    func getDay() {
        let calendar = Calendar.current
        dayField = calendar.component(Calendar.Component.day, from: datePicker.date)
                   
    }
    //We pass on the mont information.

    func getMont() {
        let calendar = Calendar.current
        montField = calendar.component(Calendar.Component.month, from: datePicker.date)
                
    }
    
}
