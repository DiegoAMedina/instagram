//
//  PostCell.swift
//  instragram
//
//  Created by Diego Medina on 2/23/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    var instagramPost: PFObject!{
        didSet{
            self.postImageView.file = instagramPost["image"] as? PFFile
            self.postImageView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
