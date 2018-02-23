//
//  homePageViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/22/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit

class homePageViewController: UIViewController {
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButtonPressed(_ sender: Any) {
    
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    //    func addNavBarImage(){
    //
    //        let navController = navigationController!
    //
    //        let image = #imageLiteral(resourceName: "newNavImage.png")
    //        let imageView = UIImageView(image: image)
    //
    //        let bannerWidth = navController.navigationBar.frame.size.width
    //        let bannerHeight = navController.navigationBar.frame.size.height
    //
    //        let bannerX = bannerWidth / 2 - image.size.width / 2
    //        let bannerY = bannerHeight / 2 - image.size.height / 2
    //
    //        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
    //        imageView.contentMode = .scaleAspectFit
    //
    //        navigationItem.titleView = imageView
    //    }

}
