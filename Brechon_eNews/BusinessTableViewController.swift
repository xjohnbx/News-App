//
//  BusinessTableViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class BusinessTableViewController: UITableViewController {

    
    var BusinessArticles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        fetchJSONData()
        
                //Setting up the height of the cell
        self.tableView.rowHeight = 330
        self.tableView.reloadData()
    }

    
    
        //Getting the article data
    func fetchJSONData() {
        
                //Getting the URL for the API data
        guard let api_url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e84cbe91a39a4fcba69f7abf0b82613e")
            else {return}
    
        let urlRequest = URLRequest(url: api_url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            if let content = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                
                            //Getting each row from the 'Articles'
                    if let articlesJson = jsonObject["articles"] as? [[String:AnyObject]] {
                        for eachArticle in articlesJson
                        {
                                    //Giving values from each field of the entity
                            if let title = eachArticle["title"] as? String,
                               let source = eachArticle["source"]!["name"] as? String,
                               let author = eachArticle["author"] as? String,
                               let desc = eachArticle["description"] as? String,
                               let url = eachArticle["url"] as? String,
                               let urlToImage = eachArticle["urlToImage"] as? String,
                               let pubAt = eachArticle["publishedAt"] as? String
                            {
                                        //Adding the entity to the array
                                self.BusinessArticles.append(Article(Author: author, Title: title, Description: desc, URL: url, URLToImage: urlToImage, PublishedAt: pubAt, Source: source))

                            }
                        }
                    }
                            //Reloading the table view
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                catch { print(error) }
            }
        }
        task.resume()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BusinessArticles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessTableViewCell
        
        let business:Article = BusinessArticles[indexPath.row]

            //Setting up the cell format
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 7
        
            //Giving value to the fields in the cell
        cell.businessImageView.imageFromServerURL(urlString: business.URLToImage)
        cell.businessDateLabel.text = business.PublishedAt
        cell.businessTitleLabel.text = business.Title
        cell.businessSourceLabel.text = business.Source

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "businessDetail")
        {
            let destVC = segue.destination as! BusinessDetailViewController
            
                //Passing the necessary info to the Detail VC
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let business:Article = BusinessArticles[indexPath.row]
                destVC.btvTitle = business.Title
                destVC.btvAuthor = business.Author
                destVC.btvDescription = business.Description
                destVC.btvDate = business.PublishedAt
                destVC.btvImage = business.URLToImage
                destVC.btvWebSite = business.URL
            }
        }
    }
    

}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

