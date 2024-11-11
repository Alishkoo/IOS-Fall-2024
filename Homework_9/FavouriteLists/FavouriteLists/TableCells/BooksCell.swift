//
//  BooksTableViewCell.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 11.11.2024.
//

import UIKit

class BookCell: UITableViewCell {
    
    
    var bookImageView = UIImageView()
    var bookTitleLabel = UILabel()
    var bookAuthorLabel = UILabel()
    var bookGenreLabel = UILabel()
    var bookFavouriteButton = UIButton(type: .system)
    
    var book: Book? {
        didSet{
            guard let book = book else {return}
            bookImageView.image = book.image
            bookTitleLabel.text = book.title
            bookAuthorLabel.text = "Автор: \(book.author)"
            bookGenreLabel.text = "Жанр: \(book.genre)"
            updateFavouriteButton()
        }
    }
    
    ///awakeFrom использовать если ты загружаешь с storyboard
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //
    //    }
    
    ///init лучше использовать если ты с нуля задаешь все настройки
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    private func setupViews(){
        addSubview(bookImageView)
        addSubview(bookTitleLabel)
        addSubview(bookAuthorLabel)
        addSubview(bookGenreLabel)
        addSubview(bookFavouriteButton)
        
        configureImageView()
        configureTitleLabel()
        configureAuthorLabel()
        configureGenreLabel()
        configureFavouriteButton()

        
        setImageConstraints()
        setTitleConstraints()
        setAuthorConstraints()
        setGenreConstraints()
        setFavouriteButtonConstraints()
    }
    
    
    ///Configuration methods
    func configureImageView(){
        bookImageView.layer.cornerRadius = 10
        bookImageView.clipsToBounds = true // режет фото, то что выходит за рамки
    }
    
    func configureTitleLabel(){
        bookTitleLabel.numberOfLines = 0
        bookTitleLabel.adjustsFontSizeToFitWidth = true // меняет размер так чтобы влезть в любой rectangle
    }
    
    func configureAuthorLabel(){
        bookAuthorLabel.numberOfLines = 0
        bookAuthorLabel.textColor = .darkGray
        bookAuthorLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    func configureGenreLabel(){
        bookGenreLabel.numberOfLines = 0
        bookGenreLabel.textColor = .lightGray
        bookGenreLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    func configureFavouriteButton(){
        bookFavouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)//второй аргумент это состояние кнопки
        bookFavouriteButton.tintColor = .red
        bookFavouriteButton.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
    }
    
    
    ///Objective-C func
    @objc func favouriteButtonTapped(){
        guard var book = book else {return}
        book.favourite.toggle()
        
        updateFavouriteButton()
    }
    
    func updateFavouriteButton(){
        if book?.favourite == true {
                bookFavouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                bookFavouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
    }
    
    
    ///Setup methods
    func setImageConstraints(){
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 179/281).isActive = true
    }
    
    func setTitleConstraints(){
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookTitleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setAuthorConstraints(){
        bookAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        bookAuthorLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 5).isActive = true
        bookAuthorLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    
    func setGenreConstraints(){
        bookGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        bookGenreLabel.topAnchor.constraint(equalTo: bookAuthorLabel.bottomAnchor, constant: 5).isActive = true
        bookGenreLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        bookGenreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    func setFavouriteButtonConstraints(){
        bookFavouriteButton.translatesAutoresizingMaskIntoConstraints = false
        bookFavouriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        bookFavouriteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bookFavouriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bookFavouriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
