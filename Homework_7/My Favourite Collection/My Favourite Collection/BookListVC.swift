//
//  BookListVC.swift
//  My Favourite Collection
//
//  Created by Alibek Baisholanov on 22.10.2024.
//

import UIKit

class BookListVC: UIViewController{
    
    var showOnlyFavourites = false
    
    var tableView = UITableView()
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alibek's Favourite Books"
        view.backgroundColor = .white
        books = fetchData()
        configureTableView()
        configureFilterButton()
    }
    
    
    ///Configured delegates, row height, register cells, constraints
    func configureTableView(){
        view.addSubview(tableView)
        
        //set delegates
        setTableViewDelegates()
        
        //set row height
        tableView.rowHeight = 100
        
        //register cells
        tableView.register(BookCell.self, forCellReuseIdentifier: "BookCell")
        
        //set constaints
//        tableView.pin(to: view)
        tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureFilterButton() {
            let filterButton = UIButton(type: .system)
            filterButton.setTitle("Show only Favourite", for: .normal)
            filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
            filterButton.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(filterButton)
            
            
            NSLayoutConstraint.activate([
                filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        @objc func filterButtonTapped() {
            showOnlyFavourites.toggle()
            tableView.reloadData()
        }
}

///At least UITableView needs this to functions.
extension BookListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showOnlyFavourites ? books.filter { $0.favourite }.count : books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        let book = showOnlyFavourites ? books.filter { $0.favourite }[indexPath.row] : books[indexPath.row]
        cell.delegate = self
        cell.book = book
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = books[indexPath.row]
        
        let viewController = ViewController(data: selectedData)
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension BookListVC{
    
    func fetchData() -> [Book] {
        let book1 = Book(image: UIImage._1984, title: "1984", author: "Джордж Оруэлл", genre: "Антиутопия", favourite: true)
        let book2 = Book(image: UIImage.великийГэтсби, title: "Великий Гэтсби", author: "Фрэнсис Скотт Фицджеральд", genre: "Классический роман", favourite: false)
        let book3 = Book(image: UIImage.книжныйВор, title: "Книжный вор", author: "Маркус Зусак", genre: "Историческая проза", favourite: true)
        let book4 = Book(image: UIImage.цветыДляЭлджерона, title: "Цветы для Элджерона", author: "Дэниел Киз", genre: "Научная фантастика", favourite: true)
        let book5 = Book(image: UIImage.мартинИден, title: "Мартин Иден", author: "Джек Лондон", genre: "Приключенческий роман", favourite: true)
        let book6 = Book(image: UIImage.великийГэтсби, title: "Великий Гэтсби 2", author: "Фрэнсис Скотт Фицджеральд", genre: "Классический роман", favourite: false)
        let book7 = Book(image: UIImage.книжныйВор, title: "Книжный вор 2", author: "Маркус Зусак", genre: "Историческая проза", favourite: false)
        let book8 = Book(image: UIImage.цветыДляЭлджерона, title: "Цветы для Элджерона 2", author: "Дэниел Киз", genre: "Научная фантастика", favourite: false)
        let book9 = Book(image: UIImage.мартинИден, title: "Мартин Иден 2", author: "Джек Лондон", genre: "Приключенческий роман", favourite: false)
        let book10 = Book(image: UIImage._1984, title: "1984 2", author: "Джордж Оруэлл", genre: "Антиутопия", favourite: false)
        
        return [book1, book2, book3, book4, book5, book6, book7, book8, book9, book10]
    }
}


extension BookListVC: BookCellDelegate {
    func didChangeFavouriteStatus(for book: Book) {
        if let index = books.firstIndex(where: { $0.title == book.title }) {
            books[index].favourite.toggle() 
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
}

