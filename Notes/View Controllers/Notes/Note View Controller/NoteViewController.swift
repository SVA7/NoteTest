//
//  NoteViewController.swift
//  Notes
//
//  Created by SV_A7 on 26.09.17.
//  Copyright © 2017 SV_A7. All rights reserved.

import UIKit
import CoreData

class NoteViewController: UIViewController, UITextFieldDelegate,
UITextViewDelegate {




    // MARK: - Properties

    let segueTagsViewController       = "SegueTagsViewController"
    let segueCategoriesViewController = "SegueCategoriesViewController"

    // MARK: -


    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!

    // MARK: -

    var note: Note?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    titleTextField.delegate           = self
    contentsTextView.delegate         = self

    title                             = "Edit Note"

        setupView()

        setupNotificationHandling()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Update Note
    if let title                      = titleTextField.text, !title.isEmpty {
    note?.title                       = title
        }

    note?.updatedAt                   = Date()
    note?.contents                    = contentsTextView.text
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: - View Methods

    fileprivate func setupView() {

        setupTitleTextField()
        setupContentsTextView()
    }

    // MARK: -



    private func setupTitleTextField() {
        // Configure Title Text Field
    titleTextField.text               = note?.title
    }

    private func setupContentsTextView() {
        // Configure Contents Text View
    contentsTextView.text             = note?.contents
    }

    // MARK: - Notification Handling

    @objc func managedObjectContextObjectsDidChange(_ notification: Notification) {
    guard let userInfo                = notification.userInfo else { return }
        guard (userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject>) != nil else { return }

    }

    // MARK: - Helper Methods

    private func setupNotificationHandling() {
    let notificationCenter            = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange(_:)), name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: note?.managedObjectContext)
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

