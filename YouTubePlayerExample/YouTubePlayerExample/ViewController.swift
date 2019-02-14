//
//  ViewController.swift
//  YouTubePlayerExample
//
//  Created by Giles Van Gruisen on 1/31/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {

    @IBOutlet var playerView: YouTubePlayerView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var currentTimeButton: UIButton!
    @IBOutlet var durationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func play(sender: UIButton) {
        if playerView.isReady {
            if playerView.playerState != .playing {
                playerView.playVideo()
                playButton.setTitle("Pause", for: .normal)
            } else {
                playerView.pauseVideo()
                playButton.setTitle("Play", for: .normal)
            }
        }
    }

    @IBAction func prev(sender: UIButton) {
        playerView.previousVideo()
    }

    @IBAction func next(sender: UIButton) {
        playerView.nextVideo()
    }

    @IBAction func loadVideo(sender: UIButton) {
        playerView.playerParams.playsInline = true
        playerView.playerParams.showControls = true
        playerView.playerParams.showInfo = false

        playerView.loadVideoID("YbJOTdZBX1g")
    }

    @IBAction func loadPlaylist(sender: UIButton) {
        playerView.loadPlaylistID("RDe-ORhEE9VVg")
    }
    
    @IBAction func currentTime(sender: UIButton) {
        playerView.getCurrentTime { seconds in
            let title = "Current Time \(seconds)"
            self.currentTimeButton.setTitle(title, for: .normal)
        }
    }
    
    @IBAction func duration(sender: UIButton) {
        playerView.getDuration { seconds in
            let title = "Current Time \(seconds)"
            self.durationButton.setTitle(title, for: .normal)
        }
    }

    func showAlert(message: String) {
        self.present(alertWithMessage(message: message), animated: true, completion: nil)
    }

    func alertWithMessage(message: String) -> UIAlertController {
        let alertController =  UIAlertController(title: "", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        return alertController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

