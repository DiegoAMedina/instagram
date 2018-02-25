//
//  homePageViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/22/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit
import Parse

class homePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var postsTableView: UITableView!
    var refreshControl : UIRefreshControl!
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // refreshes post when user opens application for first time
        fetchPosts()
        
        // tableView
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.rowHeight = UITableViewAutomaticDimension
        postsTableView.estimatedRowHeight = 120

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(homePageViewController.didPullToRefresh(_:)), for: .valueChanged)
        postsTableView.insertSubview(refreshControl, at: 0)
        
        // "back up refresh" incase top fetchPost() doesn't refresh
        fetchPosts()

    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchPosts()
    }
    
    func fetchPosts(){
        let query = Post.query()
        query?.limit = 20
        query?.order(byDescending: "_created_at")
        query?.findObjectsInBackground(block: { (posts, error) in
            if(posts != nil){
                
                self.posts = posts as! [Post]
                self.postsTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
            else{
                print(error?.localizedDescription)
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButtonPressed(_ sender: Any) {
    
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil{
            return posts.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath as IndexPath) as! PostCell
        let post = posts[indexPath.row]
        
        cell.postCaptionLabel.text = post.caption
        cell.postImageView.file = post.media
        cell.postImageView.loadInBackground()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PostCell
        
        if let indexPath = postsTableView.indexPath(for: cell){
            
            let postIndexPath = posts[indexPath.row]
            let detailViewController = segue.destination as! PostDetailsViewController
            
            detailViewController.postImageFile = postIndexPath.media
            detailViewController.captionString = postIndexPath.caption
            
            // retrieve date post was created
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .short
            df.locale = Locale.current
            
            
            detailViewController.timeStampString = df.string(from: self.posts[(indexPath.section)].createdAt!)
        }
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
