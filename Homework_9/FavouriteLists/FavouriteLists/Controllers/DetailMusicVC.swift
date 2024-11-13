//
//  DetailMusicVC.swift
//  FavouriteLists
//
//  Created by Alibek Baisholanov on 13.11.2024.
//

import UIKit
import AVFoundation

class DetailMusicVC: UIViewController, AVAudioPlayerDelegate {
    
    var music: Music
    var audioPlayer: AVAudioPlayer!
    
    let musicImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let playButton = UIButton(type: .system)
    
    init(music: Music) {
        self.music = music
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        configureMusic()
    }
    
    private func setupViews() {
            
        musicImageView.image = music.image
        musicImageView.contentMode = .scaleAspectFill
        musicImageView.layer.cornerRadius = 10
        musicImageView.clipsToBounds = true
        view.addSubview(musicImageView)
            
           
        titleLabel.text = music.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
            
           
        authorLabel.text = "Автор: \(music.Author)"
        authorLabel.font = UIFont.systemFont(ofSize: 18)
        authorLabel.textAlignment = .center
        authorLabel.textColor = .darkGray
        view.addSubview(authorLabel)
            
          
        playButton.setTitle("Воспроизвести", for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        view.addSubview(playButton)
    }
    
    private func setupConstraints() {
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            musicImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            musicImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            musicImageView.widthAnchor.constraint(equalToConstant: 200),
            musicImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: musicImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            playButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 30),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureMusic() {
        if let audioPath = Bundle.main.path(forResource: music.title, ofType: "mp3") {
            let url = URL(fileURLWithPath: audioPath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            } catch {
                print("Ошибка при загрузке аудиофайла: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func playButtonTapped() {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            playButton.setTitle("Воспроизвести", for: .normal)
        } else {
            player.play()
            playButton.setTitle("Пауза", for: .normal)
        }
    }

}
