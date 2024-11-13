//
//  FilmCell.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 12.11.2024.
//

import UIKit

class FilmCell: UITableViewCell {
    
    var filmImage = UIImageView()
    var filmTitle = UILabel()
    var filmYear = UILabel()
    
    var film: Film? {
        didSet{
            guard let film = film else {return}
            filmImage.image = film.image
            filmTitle.text = film.title
            filmYear.text = "Год выпуска: \(film.year)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    private func setupViews(){
        addSubview(filmImage)
        addSubview(filmTitle)
        addSubview(filmYear)
        
        
        configureImageView()
        configureTitleView()
        configureYearView()
        
        
        setImageConstraints()
        setTitleConstraints()
        setYearConstraints()
    }
    
    ///configure the views size and how it will look like
    private func configureImageView(){
        filmImage.layer.cornerRadius = 10
        filmImage.clipsToBounds = true
    }
    
    private func configureTitleView(){
        filmTitle.numberOfLines = 0
        filmTitle.adjustsFontSizeToFitWidth = true
        filmTitle.font = UIFont.systemFont(ofSize: 22)
    }
    
    private func configureYearView(){
        filmYear.font = UIFont.systemFont(ofSize: 14)
        filmYear.textColor = .darkGray
    }
    
    
    ///setup constraints
    private func setImageConstraints(){
        filmImage.translatesAutoresizingMaskIntoConstraints = false
        filmImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        filmImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        filmImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        filmImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setTitleConstraints(){
        filmTitle.translatesAutoresizingMaskIntoConstraints = false
        filmTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        filmTitle.leadingAnchor.constraint(equalTo: filmImage.trailingAnchor, constant: 20).isActive = true
        filmTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    private func setYearConstraints(){
        filmYear.translatesAutoresizingMaskIntoConstraints = false
        filmYear.topAnchor.constraint(equalTo: filmTitle.bottomAnchor, constant: 5).isActive = true
        filmYear.leadingAnchor.constraint(equalTo: filmImage.trailingAnchor, constant: 20).isActive = true
        filmYear.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
