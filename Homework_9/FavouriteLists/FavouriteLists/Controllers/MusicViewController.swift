//
//  MusicViewController.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 11.11.2024.
//

import UIKit

class MusicViewController: UIViewController {

    var tableView = UITableView()
    var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Music"
        musicList = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        // Set delegates
        setDelegates()
        
        // Set row height
        tableView.rowHeight = 130
        
        // Register cells
        tableView.register(MusicCell.self, forCellReuseIdentifier: "MusicCell")
        
        // Set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    // количество
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //настраили отдельную ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        let music = musicList[indexPath.row]
        cell.music = music
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let music = musicList[indexPath.row]
        
        let vc = DetailMusicVC(music: music)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MusicViewController {
    
    
    private func fetchData() -> [Music] {
        let music1 = Music(image: UIImage(named: "SweaterWeather")!, title: "Sweater Weather", Author: "The Neighbourhood")
        let music2 = Music(image: UIImage(named: "Chihiro")!, title: "Chihiro", Author: "Billie Eilish")
       
        
        return [music1, music2]
    }
}
