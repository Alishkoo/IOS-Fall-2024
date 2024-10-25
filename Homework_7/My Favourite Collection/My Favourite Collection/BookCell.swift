//
//  TableViewCell.swift
//  My Favourite Collection
//
//  Created by Alibek Baisholanov on 22.10.2024.
//

import UIKit

class BookCell: UITableViewCell {
    
    var bookImageView = UIImageView()
    var bookTitleLabel = UILabel()
    var bookAuthorLabel = UILabel()
    var bookGenreLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(bookImageView)
        addSubview(bookTitleLabel)
        addSubview(bookAuthorLabel)
        addSubview(bookGenreLabel)

        
        configureImageView()
        configureTitleLabel()
        configureAuthorLabel()
        configureGenreLabel()

        
        setImageConstraints()
        setTitleLabelConstraints()
        setAuthorLabelConstraints()
        setGenreLabelConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

         }
    
    func set(book: Book) {
        bookImageView.image = book.image
        bookTitleLabel.text = book.title
        bookAuthorLabel.text = "Автор: \(book.author)"
        bookGenreLabel.text = "Жанр: \(book.genre)"
    }
    
    
    ///Configuration methods
    func configureImageView() {
        bookImageView.layer.cornerRadius = 10
        bookImageView.clipsToBounds = true
    }

    func configureTitleLabel() {
        bookTitleLabel.numberOfLines = 0
        bookTitleLabel.adjustsFontSizeToFitWidth = true
    }

    func configureAuthorLabel() {
        bookAuthorLabel.font = UIFont.systemFont(ofSize: 14)
        bookAuthorLabel.textColor = .darkGray
    }

    func configureGenreLabel() {
        bookGenreLabel.font = UIFont.systemFont(ofSize: 14)
        bookGenreLabel.textColor = .lightGray
    }

    
    
    ///Setup methods
    func setImageConstraints() {
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: bookImageView.heightAnchor, multiplier: 179/281).isActive = true
    }

    func setTitleLabelConstraints() {
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bookTitleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

    func setAuthorLabelConstraints() {
        bookAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        bookAuthorLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 5).isActive = true
        bookAuthorLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookAuthorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

    func setGenreLabelConstraints() {
        bookGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        bookGenreLabel.topAnchor.constraint(equalTo: bookAuthorLabel.bottomAnchor, constant: 5).isActive = true
        bookGenreLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20).isActive = true
        bookGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        bookGenreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
