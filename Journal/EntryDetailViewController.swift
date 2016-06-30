//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Jeff Norton on 6/29/16.
//  Copyright © 2016 JCN. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?

    // MARK: - Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextArea: UITextView!
    
    
    // MARK: - General
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyTextArea.layer.borderColor = UIColor.blackColor().CGColor

        if let entry = entry {
            updateWith(entry)
        }
    }
    
    // MARK: - Methods
    
    func updateWith(entry: Entry) {
        
        titleTextField.text = entry.title
        bodyTextArea.text = entry.text
        
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let title = titleTextField?.text, let body = bodyTextArea?.text where title.characters.count > 0 && body.characters.count > 0 else {
            return
        }
        
        let now = NSDate()
        let entry = Entry(title: title, text: body, timestamp: now)
        
        EntryController.sharedController.addEntry(entry)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextArea.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
