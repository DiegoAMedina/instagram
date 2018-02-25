//
//  PhotoMapViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/22/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageToPost: UIImageView!
    @IBOutlet weak var captionToPost: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.captionToPost.delegate = self
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // compress image
        let editedImage = resize(image: originalImage, newSize: CGSize(width: 300, height: 300))
        
        // add edited image to UI
        imageToPost.image = editedImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPostButtonPressed(_ sender: Any) {
        Post.postUserImage(image: imageToPost.image, withCaption: captionToPost.text) { (success, error) in
            if success{
                print("IMAGE UPLOAD SUCCESSFUL!!")
                
                // go back to homePage after upload
                let next = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UIViewController
                self.present(next, animated: true, completion: nil)
            }
            else{
                print(error?.localizedDescription)
                self.captionToPost.text = "ERROR: unable to post image"
            }//else
            
        }
        
    }//onPostButtonPressed
    
    @IBAction func onCameraPress(_ sender: Any) {
        
        // instatiate a UIImagePickerController
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
            self.present(vc, animated: true, completion: nil)
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            //vc.sourceType = .photoLibrary
        }

        
    }
    
    @IBAction func onLibraryPress(_ sender: Any) {
        
        // instatiate a UIImagePickerController
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            print("Photo library is available 📸")
            vc.sourceType = .photoLibrary
            self.present(vc, animated: true, completion: nil)
        } else {
            print("Photo library 🚫 available so we will use photo library instead")
            //vc.sourceType = .camera
        }
        
    }
    
    // resize image
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    // hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
