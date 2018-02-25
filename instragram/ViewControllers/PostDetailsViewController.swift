//
//  PostDetailsViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/24/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostDetailsViewController: UIViewController {

    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    var postImageFile: PFFile!
    var timeStampString = String()
    var captionString = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImageView.file = postImageFile
        postImageView.loadInBackground()
        
        timeStampLabel.text = timeStampString
        captionLabel.text = captionString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
