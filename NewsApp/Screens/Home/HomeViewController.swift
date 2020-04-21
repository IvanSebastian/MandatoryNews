//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Ivan Sebastian on 21/04/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import Foundation
import UIKit

class HomeViewContoller :UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnBBC: UIButton!
    @IBOutlet weak var btnUS: UIButton!
    @IBOutlet weak var btnGermany: UIButton!
    
    
    var articles:[News]? = []
    var loadingIndicator : UIActivityIndicatorView!

    
    func fetchNews(){
        let url = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=6dedfb6ad006408e94c33c3427eab2ec")!)
        
        let tap = URLSession.shared.dataTask(with: url){ (data,response,error) in
            
            if error != nil{
                print(error)
                return
            }
            
            self.articles = [News]()
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]]{
                    for articleFromJson in articlesFromJson{
                        
                        let article = News()
                        
                        if let title = articleFromJson["title"] as? String,let author = articleFromJson["author"] as? String,let desc = articleFromJson["description"] as? String,let url = articleFromJson["url"]as? String,let imageToUrl = articleFromJson["urlToImage"] as? String {
                         
                            article.author = author
                            article.desc = desc
                            article.headline = title
                            article.url = url
                            article.imgUrl = imageToUrl
                        }
                        
                        self.articles?.append(article)
                        
                    }
                }
                
                DispatchQueue.main.async{
                    
                    self.mTableView.reloadData()
                }
                
            }catch let error {
                print(error)
            }
        }
        tap.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        
        cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imgUrl!)!)
        cell.lbltitle.text = self.articles?[indexPath.item].headline
        cell.lblDesc.text = self.articles?[indexPath.item].desc
        cell.lblAuthor.text = self.articles?[indexPath.item].author
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }
    
}


extension UIImageView{
    func downloadImage(from url:String){
        let url = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
        
        
        
}
