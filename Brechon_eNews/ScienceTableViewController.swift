//
//  ScienceTableViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ScienceTableViewController: UITableViewController {
    
    var ScienceArticles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        fetchJSONData()
        
            //Formatting the height of the View Controller
        self.tableView.rowHeight = 330
        self.tableView.reloadData()
    }
    
    
            //Getting the JSON data
    func fetchJSONData() {
        
                //Grabbing the URL of the API
        guard let api_url = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=e84cbe91a39a4fcba69f7abf0b82613e")
            else {return}
        
        let urlRequest = URLRequest(url: api_url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
                    //This parses the JSON Data and adds it to the array
            if let content = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    if let articlesJson = jsonObject["articles"] as? [[String:AnyObject]] {
                        for eachArticle in articlesJson
                        {
                                    //Setting the JSON Data row by row
                            if let title = eachArticle["title"] as? String,
                                let author = eachArticle["author"] as? String,
                                let source = eachArticle["source"]!["name"] as? String,
                                let desc = eachArticle["description"] as? String,
                                let url = eachArticle["url"] as? String,
                                let urlToImage = eachArticle["urlToImage"] as? String,
                                let pubAt = eachArticle["publishedAt"] as? String
                            {
                                
                                        //Adding an entity to the array
                                self.ScienceArticles.append(Article(Author: author, Title: title, Description: desc, URL: url, URLToImage: urlToImage, PublishedAt: pubAt, Source: source))
                                
                            }
                        }
                    }
                        //This reloads the table View
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
        return ScienceArticles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScienceCell", for: indexPath) as! ScienceTableViewCell
        
        let Science:Article = ScienceArticles[indexPath.row]
        
            //Formatting the cell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 7
        
            //Giving values to the cell fields
        cell.scienceImage.imageFromServerURL(urlString: Science.URLToImage)
        cell.scienceDate.text = Science.PublishedAt
        cell.scienceTitle.text = Science.Title
        cell.scienceSource.text = Science.Source
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "scienceDetail")
        {
            let destVC = segue.destination as! ScienceDetailViewController
            
                    //This sends the values to the DVC
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let science:Article = ScienceArticles[indexPath.row]
                
                destVC.sctvTitle = science.Title
                destVC.sctvAuthor = science.Author
                destVC.sctvDescription = science.Description
                destVC.sctvDate = science.PublishedAt
                destVC.sctvImage = science.URLToImage
                destVC.sctvWebSite = science.URL
            }
        }
    }
    
}
