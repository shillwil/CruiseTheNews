//
//  CruiseTheNewsTableViewController.swift
//  CruiseTheNews
//
//  Created by Johnny Hicks on 12/13/18.
//  Copyright © 2018 Johnny Hicks. All rights reserved.
//

import UIKit

class CruiseTheNewsTableViewController: UITableViewController {
    
    var newsArticles: [NewsArticle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsArticleController.shared.fetchArticles { (articles) in
            if let articles = articles {
                self.newsArticles = articles
            }
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArticles.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)

        let article = self.newsArticles[indexPath.row]
        
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
