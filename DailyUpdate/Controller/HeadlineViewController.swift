//
//  HeadlineViewController.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 22/06/23.
//

import UIKit

class HeadlineViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var fetchedArticles = [Article]()
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
    
    func downloadImage(from url: URL, cell: NewsDescCell){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                print("error while fetching image")
                return
            }
            
            if let safeData = data{
                DispatchQueue.main.async {
                    cell.newsImage.image = UIImage(data: safeData)
                    print("Image will be displayed")
                }
            }
        }
        task.resume()
    }
}

// MARK: - TableDataSource
extension HeadlineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedArticles.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! NewsDescCell
            cell.titleLabel.text = self.fetchedArticles[indexPath.row].title
            cell.descLabel.text = self.fetchedArticles[indexPath.row].description
            cell.newsDate.text = "\(self.fetchedArticles[indexPath.row].publishedAt)"
            if let url = URL(string: self.fetchedArticles[indexPath.row].urlToImage!){
                self.downloadImage(from: url, cell: cell)
            }
        
        return cell;
    }
}

//MARK: - TableDelegate
extension HeadlineViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: fetchedArticles[indexPath.row].url){
            if #available(iOS 10, *){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//

// MARK: - NewsManagerDelegate

extension HeadlineViewController: NewsManagerDelegate{
    func didfetchArticles(articles: [Article]) {
        print("protocol working\n")
        DispatchQueue.main.async {
            self.fetchedArticles = articles
            print(articles.count)
            self.tableView.reloadData()
        }
        
//        for art in articles {
//            print("\(art.title)\n")
//        }
    }
    
    func didEndWithError(error: Error) {
        print("Error ahahaha")
    }
}
