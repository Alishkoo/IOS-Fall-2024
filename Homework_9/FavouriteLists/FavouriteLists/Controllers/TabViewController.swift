//
//  TabViewController.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 11.11.2024.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpTabs()
    }
    
    
    private func setUpTabs(){
        let booksVC = BooksViewController()
        let filmsVC = FilmsViewController()
        let musicVC = MusicViewController()
        
        booksVC.navigationItem.largeTitleDisplayMode = .automatic
        filmsVC.navigationItem.largeTitleDisplayMode = .automatic
        musicVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: booksVC)
        let nav2 = UINavigationController(rootViewController: filmsVC)
        let nav3 = UINavigationController(rootViewController: musicVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Books", image: UIImage(systemName: "book"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Films", image: UIImage(systemName: "film"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        
        for nav in [nav1, nav2, nav3]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }
    

}
