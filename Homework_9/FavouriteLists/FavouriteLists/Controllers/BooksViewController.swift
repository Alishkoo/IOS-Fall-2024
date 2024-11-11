//
//  BooksViewController.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 11.11.2024.
//

import UIKit

class BooksViewController: UIViewController {

    var tableView = UITableView()
    var books: [Book] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Books"
        
        books = fetchData()
        configureTableView()
        
    }
    
    
    private func configureTableView(){
        view.addSubview(tableView)
        
        //Set delegates
        setTableViewDelegates()
        
        //set the height
        tableView.rowHeight = 100
        
        //register cells
        tableView.register(BookCell.self, forCellReuseIdentifier: "BookCell")
        
        //set constraints of tab bar
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        let book = books[indexPath.row]
        
        //cell.delegate = self
        cell.book = book
        
        return cell
    }
    
    //TODO: realease didselectedat
    
}


extension BooksViewController{
    
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


//extension BookListVC: BookCellDelegate {
//    func didChangeFavouriteStatus(for book: Book) {
//        if let index = books.firstIndex(where: { $0.title == book.title }) {
//            books[index].favourite.toggle()
//            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
//        }
//    }
//}

