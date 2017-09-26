//
//  AddNoteViewController.swift
//  Notes
//
//  Created by SV_A7 on 26.09.17.
//  Copyright © 2017 SV_A7. All rights reserved.

import UIKit
import CoreData

class AddNoteViewController: UIViewController, UITextFieldDelegate,
UITextViewDelegate {

    // MARK: - Properties

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!

    // MARK: -

    var managedObjectContext: NSManagedObjectContext?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        contentsTextView.delegate = self

        title = "Add Note"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Show Keyboard
        titleTextField.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func save(sender: UIBarButtonItem) {
        guard let managedObjectContext = managedObjectContext else { return }
        guard let title = titleTextField.text, !title.isEmpty else {
            showAlert(with: "Title Missing", and: "Your note doesn't have a title.")
            return
        }

        // Create Note
        let note = Note(context: managedObjectContext)

        // Configure Note
        note.createdAt = Date()
        note.updatedAt = Date()
        note.title = titleTextField.text
        note.contents = contentsTextView.text

        // Pop View Controller
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Text keyboard hidden
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}
