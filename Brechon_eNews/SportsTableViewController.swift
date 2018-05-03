//
//  SportsTableViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class SportsTableViewController: UITableViewController {

    
    var SportsArticles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        fetchJSONData()
        
                //Setting up the height of the cell
        self.tableView.rowHeight = 330
        self.tableView.reloadData()
    }
    
    
            //Getting the article data
    func fetchJSONData() {
        
                //Getting the URL of the API
        guard let api_url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=e84cbe91a39a4fcba69f7abf0b82613e")
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
                    
                            //This is grabbing each row of the "Articles"
                    if let articlesJson = jsonObject["articles"] as? [[String:AnyObject]] {
                        for eachArticle in articlesJson
                        {
                                //Giving values to each field of the row
                            if let title = eachArticle["title"] as? String,
                                let source = eachArticle["source"]!["name"] as? String,
                                let author = eachArticle["author"] as? String,
                                let desc = eachArticle["description"] as? String,
                                let url = eachArticle["url"] as? String,
                                let urlToImage = eachArticle["urlToImage"] as? String,
                                let pubAt = eachArticle["publishedAt"] as? String
                            {
                                        //Adding the entity to the array
                                self.SportsArticles.append(Article(Author: author, Title: title, Description: desc, URL: url, URLToImage: urlToImage, PublishedAt: pubAt, Source: source))
                            }
                        }
                    }
                            //Reloads the table View
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
        return SportsArticles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsCell", for: indexPath) as! SportsTableViewCell
        
        let Sports:Article = SportsArticles[indexPath.row]
        
                //This formats the cell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 7
        
                //giving values to the fields in the cell
        cell.sportsImage.imageFromServerURL(urlString: Sports.URLToImage)
        cell.sportsDate.text = Sports.PublishedAt
        cell.sportsTitle.text = Sports.Title
        cell.sportsSource.text = Sports.Source
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sportsDetail")
        {
            let destVC = segue.destination as! SportsDetailViewController
            
                //Passing the values that are needed for the DetailVC
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let sports:Article = SportsArticles[indexPath.row]
                destVC.stvTitle = sports.Title
                destVC.stvAuthor = sports.Author
                destVC.stvDescription = sports.Description
                destVC.stvDate = sports.PublishedAt
                destVC.stvImage = sports.URLToImage
                destVC.stvWebSite = sports.URL
            }
        }
    }
    
    
}

