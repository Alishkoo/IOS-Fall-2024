//
//  BookListVC.swift
//  My Favourite Collection
//
//  Created by Alibek Baisholanov on 22.10.2024.
//

import UIKit

class BookListVC: UIViewController{
    
    var tableView = UITableView()
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alibek's Favourite Books"
        books = fetchData()
        configureTableView()
        
    }
    
    ///Configured delegates, row height, register cells, constraints
    func configureTableView(){
        view.addSubview(tableView)
        
        //set delegates
        setTableViewDelegates()
        
        //set row height
        tableView.rowHeight = 100
        
        //register cells
        tableView.register(BookCell.self, forCellReuseIdentifier: "VideoCell")
        
        //set constaints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

///At least UITableView needs this to functions.
extension BookListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! BookCell
        let book = books[indexPath.row]
        cell.set(book: book)
        
        return cell
    }
}


extension BookListVC{
    
    func fetchData() -> [Book] {
        let book1 = Book(image: UIImage._1984, title: "1984", author: "Джордж Оруэлл", genre: "Антиутопия")
        let book2 = Book(image: UIImage.великийГэтсби, title: "Великий Гэтсби", author: "Фрэнсис Скотт Фицджеральд", genre: "Классический роман")
        let book3 = Book(image: UIImage.книжныйВор, title: "Книжный вор", author: "Маркус Зусак", genre: "Историческая проза")
        let book4 = Book(image: UIImage.цветыДляЭлджерона, title: "Цветы для Элджерона", author: "Дэниел Киз", genre: "Научная фантастика")
        let book5 = Book(image: UIImage.мартинИден, title: "Мартин Иден", author: "Джек Лондон", genre: "Приключенческий роман")
        let book6 = Book(image: UIImage.великийГэтсби, title: "Великий Гэтсби", author: "Фрэнсис Скотт Фицджеральд", genre: "Классический роман")
        let book7 = Book(image: UIImage.книжныйВор, title: "Книжный вор", author: "Маркус Зусак", genre: "Историческая проза")
        let book8 = Book(image: UIImage.цветыДляЭлджерона, title: "Цветы для Элджерона", author: "Дэниел Киз", genre: "Научная фантастика")
        let book9 = Book(image: UIImage.мартинИден, title: "Мартин Иден", author: "Джек Лондон", genre: "Приключенческий роман")
        let book10 = Book(image: UIImage._1984, title: "1984", author: "Джордж Оруэлл", genre: "Антиутопия")
        
        return [book1, book2, book3, book4, book5, book6, book7, book8, book9, book10]
    }
}

