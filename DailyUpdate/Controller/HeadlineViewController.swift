//
//  HeadlineViewController.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 22/06/23.
//

import UIKit

class HeadlineViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var newsMan = NewsManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsDescCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        // Do any additional setup after loading the view.
        newsMan.delegate = self
        newsMan.fetchArticles(countryCode: "in")
        
        print("Hello world")
    }
}

// MARK: - TableDataSource
extension HeadlineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! NewsDescCell
        return cell;
    }
}

//MARK: - TableDelegate
extension HeadlineViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected")
    }
}

//

// MARK: - NewsManagerDelegate

extension HeadlineViewController: NewsManagerDelegate{
    func didfetchArticles(articles: [Article]) {
        print("protocol working\n")
        for art in articles {
            print("\(art.title)\n")
        }
    }
    
    func didEndWithError(error: Error) {
        print("Error ahahaha")
    }
}
