//
//  FilmsViewController.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 11.11.2024.
//

import UIKit

class FilmsViewController: UIViewController {

    var tableView = UITableView()
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Films"
        films = fetchData()
        configureTableView()
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
        //set delegates
        setDelegates()
        
        //set row hight
        tableView.rowHeight = 130
        
        //register cells
        tableView.register(FilmCell.self, forCellReuseIdentifier: "FilmCell")
        
        //set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
    
    func setDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    
}


extension FilmsViewController: UITableViewDelegate,UITableViewDataSource{
    
    //количество cell в tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    //возвращает сами filmCells и настраивает сами cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell") as! FilmCell
        
        let film = films[indexPath.row]
        cell.film = film
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = films[indexPath.row]
        
        let vc = DetailFilmVC(film: film)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension FilmsViewController{
    private func fetchData() -> [Film]{
        let film1 = Film(image: UIImage.интерстеллар, title: "Интерстеллар", year: "2014")
        let film2 = Film(image: UIImage.довод, title: "Довод", year: "2020")
        let film3 = Film(image: UIImage.начало, title: "Начало", year: "2010")
        let film4 = Film(image: UIImage.опенгеймер, title: "Опенгеймер", year: "2023")
        let film5 = Film(image: UIImage.темныйРыцарь, title: "Темный Рыцарь", year: "2008")
        let film6 = Film(image: UIImage.темныйРыцарь2, title: "Темный Рыцарь 2", year: "2010")
        let film7 = Film(image: UIImage.инсомния, title: "Инсомния", year: "2007")
        let film8 = Film(image: UIImage.престиж, title: "Престиж", year: "2006")
        
        return [film1, film2, film3, film4, film5, film6, film7, film8]
    
        
    }
}
