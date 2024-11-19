//
//  ViewController.swift
//  test123
//
//  Created by Alibek Baisholanov on 15.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    

    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settableview()
        tableView.dataSource = self
        
        view.backgroundColor = .white
    }

    func settableview(){
        view.addSubview(tableView)
        
        tableView.rowHeight = 50
        
        tableView.register(tableCellTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableCellTableViewCell
        
        cell.setlabel(text: String(indexPath.row))
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

}




