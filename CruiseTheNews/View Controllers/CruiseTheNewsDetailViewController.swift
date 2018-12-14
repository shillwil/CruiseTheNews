//
//  CruiseTheNewsDetailViewController.swift
//  CruiseTheNews
//
//  Created by Johnny Hicks on 12/13/18.
//  Copyright © 2018 Johnny Hicks. All rights reserved.
//

import UIKit

class CruiseTheNewsDetailViewController: UIViewController {
    
    // Properties and Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var articleContentLabel: UILabel!
    
    var newsArticle: NewsArticle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let article = self.newsArticle else { return }

        self.titleLabel.text = article.title
        self.authorLabel.text = article.author ?? ""
        self.articleContentLabel.text = article.content ?? ""
    }
}
