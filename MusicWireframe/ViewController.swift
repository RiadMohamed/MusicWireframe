//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Riad Mohamed on 7/23/19.
//  Copyright © 2019 Riad Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
            } else {
                playPauseButton.setImage(UIImage(named: "play")!, for: .normal)
            }
        }
    }
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseShadow: UIView!
    @IBOutlet weak var playPauseShadow: UIView!
    @IBOutlet weak var forwardShadow: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseShadow.layer.cornerRadius = 35.0
        reverseShadow.clipsToBounds = true
        reverseShadow.alpha = 0
        
        playPauseShadow.layer.cornerRadius = 35.0
        playPauseShadow.clipsToBounds = true
        playPauseShadow.alpha = 0
        
        forwardShadow.layer.cornerRadius = 35.0
        forwardShadow.clipsToBounds = true
        forwardShadow.alpha = 0
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform.identity
            }
        }
        isPlaying.toggle()
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        switch sender {
        case reverseButton:
            buttonBackground = reverseShadow
        case playPauseButton:
            buttonBackground = playPauseShadow
        case forwardButton:
            buttonBackground = forwardShadow
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
   
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        switch sender {
        case reverseButton:
            buttonBackground = reverseShadow
        case playPauseButton:
            buttonBackground = playPauseShadow
        case forwardButton:
            buttonBackground = forwardShadow
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
    
    
    
}

