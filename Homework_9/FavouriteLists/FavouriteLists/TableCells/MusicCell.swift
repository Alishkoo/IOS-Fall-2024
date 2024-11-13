//
//  MusicCell.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 13.11.2024.
//

import UIKit

import UIKit

class MusicCell: UITableViewCell {
    
    var musicImage = UIImageView()
    var musicTitle = UILabel()
    var musicAuthor = UILabel()
    
    var music: Music? {
        didSet {
            guard let music = music else { return }
            musicImage.image = music.image
            musicTitle.text = music.title
            musicAuthor.text = "Автор: \(music.Author)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(musicImage)
        addSubview(musicTitle)
        addSubview(musicAuthor)
        
        configureImageView()
        configureTitleView()
        configureAuthorView()
        
        setImageConstraints()
        setTitleConstraints()
        setAuthorConstraints()
    }
    
    /// configure views
    private func configureImageView() {
        musicImage.layer.cornerRadius = 10
        musicImage.clipsToBounds = true
    }
    
   
    private func configureTitleView() {
        musicTitle.numberOfLines = 0
        musicTitle.adjustsFontSizeToFitWidth = true
        musicTitle.font = UIFont.systemFont(ofSize: 22)
    }
    
  
    private func configureAuthorView() {
        musicAuthor.font = UIFont.systemFont(ofSize: 14)
        musicAuthor.textColor = .darkGray
    }
    
    
    ///set constraints
    private func setImageConstraints() {
        musicImage.translatesAutoresizingMaskIntoConstraints = false
        musicImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        musicImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        musicImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        musicImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    private func setTitleConstraints() {
        musicTitle.translatesAutoresizingMaskIntoConstraints = false
        musicTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        musicTitle.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: 20).isActive = true
        musicTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
    private func setAuthorConstraints() {
        musicAuthor.translatesAutoresizingMaskIntoConstraints = false
        musicAuthor.topAnchor.constraint(equalTo: musicTitle.bottomAnchor, constant: 5).isActive = true
        musicAuthor.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: 20).isActive = true
        musicAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
