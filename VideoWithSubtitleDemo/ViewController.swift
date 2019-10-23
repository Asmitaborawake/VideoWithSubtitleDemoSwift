//
//  ViewController.swift
//  VideoWithSubtitleDemo
//
//  Created by Asmita Borawake on 23/10/19.
//  Copyright © 2019 Asmita Borawake. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        playVideoWithSubtitle()
    }

    
    func playVideoWithSubtitle(){
        
        // Video file
        let videoFile = Bundle.main.path(forResource: "trailer_720p", ofType: "mov")
        
        // Local subtitle file
        let subtitleFile = Bundle.main.path(forResource: "trailer_720p", ofType: "srt")
        let subtitleURL = URL(fileURLWithPath: subtitleFile!)
        
        // Remote subtitle file
        let subtitleRemoteUrl = URL(string: "https://raw.githubusercontent.com/furkanhatipoglu/AVPlayerViewController-Subtitles/master/Example/AVPlayerViewController-Subtitles/trailer_720p.srt")
        
        // Movie player
        let moviePlayer = AVPlayerViewController()
        moviePlayer.player = AVPlayer(url: URL(fileURLWithPath: videoFile!))
        present(moviePlayer, animated: true, completion: nil)
        
        // Add subtitles - local
         moviePlayer.addSubtitles().open(fileFromLocal: subtitleURL)
         moviePlayer.addSubtitles().open(fileFromLocal: subtitleURL, encoding: .utf8)
        
        // Add subtitles - remote
      //  moviePlayer.addSubtitles().open(fileFromRemote: subtitleRemoteUrl!)
        
        // Change text properties
        moviePlayer.subtitleLabel?.textColor = UIColor.red
        
        // Play
        moviePlayer.player?.play()
    }

}

