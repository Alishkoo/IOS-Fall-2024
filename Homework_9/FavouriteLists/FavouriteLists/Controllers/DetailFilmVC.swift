//
//  DetailFilmVC.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 13.11.2024.
//

import UIKit

class DetailFilmVC: UIViewController {

    let filmImageView = UIImageView()
    let titleLabel = UILabel()
    let yearLabel = UILabel()
    
    let film: Film

    init(film: Film) {
        self.film = film
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        displayFilmDetails()
    }
    
    private func setupViews() {
        view.addSubview(filmImageView)
        view.addSubview(titleLabel)
        view.addSubview(yearLabel)
        
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            filmImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            filmImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filmImageView.widthAnchor.constraint(equalToConstant: 200),
            filmImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        yearLabel.textAlignment = .center
        yearLabel.font = UIFont.systemFont(ofSize: 16)
        yearLabel.textColor = .darkGray
    }
    
    private func displayFilmDetails() {
        filmImageView.image = film.image
        titleLabel.text = film.title
        yearLabel.text = "Year: \(film.year)"
    }
}
