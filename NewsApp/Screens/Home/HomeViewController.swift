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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.lbltitle.text = "Title test"
        
        
        return cell
    }
    
    
    
}
