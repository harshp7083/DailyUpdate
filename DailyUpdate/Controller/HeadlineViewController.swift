//
//  HeadlineViewController.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 22/06/23.
//

import UIKit

class HeadlineViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let urlString:String = "https://newsapi.org/v2/top-headlines?country=us&apiKey=c90a8b87b5a346649d40fc0f1c65a646"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsDescCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        // Do any additional setup after loading the view.
        //performRequest(urlString)
        print("Hello world")
    }
    
    
    func performRequest(_ urlString: String){
        print("perforeming")
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print("error")
                }
                
                if let safeData = data{
                    print("safeData")
                }
            }
            task.resume()
        }
        
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
