//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var existingEntry: Entry?

    // MARK: - Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextArea: UITextView!
    
    
    // MARK: - General
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyTextArea.layer.borderColor = UIColor.grayColor().CGColor
        bodyTextArea.layer.borderWidth = 1.0

        if let entry = existingEntry {
            updateWith(entry)
        }
    }
    
    // MARK: - Methods
    
    func updateWith(entry: Entry) {
        
        titleTextField.text = entry.title
        bodyTextArea.text = entry.text
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    func textViewShouldReturn(textview: UITextView) -> Bool {
        bodyTextArea.resignFirstResponder()
        return true
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(sender: AnyObject) {

        guard let title = titleTextField?.text, let body = bodyTextArea?.text where title.characters.count > 0 && body.characters.count > 0 else {
            return
        }
        
        let now = NSDate()

        /*
         * Handling:
         *  if = existing Entry
         *  else if = new Entry
         */
        if let existingEntry = existingEntry {
            
            EntryController.sharedController.updateEntry(existingEntry, title: title, text: body)
            
        } else {

            let newEntry = Entry(title: title, text: body, timestamp: now)
            EntryController.sharedController.addEntry(newEntry)
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextArea.text = ""
    }

}
