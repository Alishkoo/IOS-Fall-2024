//
//  ViewController.swift
//  CollectionExample
//
//  Created by Arman Myrzakanurov on 16.10.2024.
//

import UIKit

struct Movie {
    let title: String
    let cover: UIImage
}

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    let movies: [Movie] = [
        Movie(title: "Matrix", cover: UIImage(named: "matrix")!),
        Movie(title: "Titanic", cover: UIImage(named: "titanic")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FavCell
        let movie = movies[indexPath.row % 2]

        cell.configure(movie.cover, movie.title)
        return cell
    }
    

}
