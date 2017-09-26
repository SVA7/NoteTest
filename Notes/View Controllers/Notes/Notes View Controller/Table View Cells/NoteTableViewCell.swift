//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by SV_A7 on 26.09.17.
//  Copyright © 2017 SV_A7. All rights reserved.

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let reuseIdentifier = "NoteTableViewCell"

    // MARK: -

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var updatedAtLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
