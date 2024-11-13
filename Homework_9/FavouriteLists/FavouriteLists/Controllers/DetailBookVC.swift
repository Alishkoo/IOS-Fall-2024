//
//  DetailBookVC.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 12.11.2024.
//

import UIKit

class DetailBookVC: UIViewController{

    let bookImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let genreLabel = UILabel()
    
    var book: Book
    
    init (book: Book){
        self.book = book
        //если у тебя нет storyboard'а то и нечего нам передать к нему
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
    }
    

    private func setupViews(){
        
        bookImageView.image = book.image
        bookImageView.layer.cornerRadius = 5
        bookImageView.clipsToBounds = true
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookImageView)
        
        
        titleLabel.text = book.title
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
       
        authorLabel.text = "Автор: \(book.author)"
        authorLabel.font = UIFont.systemFont(ofSize: 18)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.numberOfLines = 0
        authorLabel.textAlignment = .center
        view.addSubview(authorLabel)
        
        
        genreLabel.text = "Жанр: \(book.genre)"
        genreLabel.font = UIFont.systemFont(ofSize: 16)
        genreLabel.numberOfLines = 0
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.textAlignment = .center
        view.addSubview(genreLabel)
        
    
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bookImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookImageView.widthAnchor.constraint(equalToConstant: 150),
            bookImageView.heightAnchor.constraint(equalToConstant: 200),
            
            
            titleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //titleLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            //authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                  
            
            genreLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            //genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                  
        ])
    }

}
