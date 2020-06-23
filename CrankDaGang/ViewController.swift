//
//  ViewController.swift
//  CrankDaGang
//
//  Created by Andre Atkins on 6/22/20.
//  Copyright © 2020 Andre Atkins. All rights reserved.
//
import MediaPlayer
import UIKit

class ViewController: UIViewController {

   var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
       
       override func viewDidLoad() {
           super.viewDidLoad()

     
       }
       
       @IBAction func stopButtonTapped(_ sender: UIButton) {
           musicPlayer.stop()
       }
       @IBAction func nextButtonTapped(_ sender: UIButton) {
           musicPlayer.skipToNextItem()
       }
       @IBAction func previousButtonTapped(_ sender: UIButton) {
           musicPlayer.skipToPreviousItem()
       }
       @IBAction func musicButtonTapped(_ sender: UIButton) {
           
           MPMediaLibrary.requestAuthorization {(status) in
               if status == .authorized{
                  DispatchQueue.main.async {
                   self.playArtist(artist: sender.currentTitle!)
                   }
                }
           }
           
           playArtist(artist: sender.currentTitle!)
       }
       
       func playArtist (artist: String){
           
           musicPlayer.stop();
           
           let query = MPMediaQuery()
           let predicate = MPMediaPropertyPredicate(value: artist, forProperty: MPMediaItemPropertyArtist)
           query.addFilterPredicate(predicate)
           musicPlayer.setQueue(with: query)
           musicPlayer.shuffleMode = .songs
           musicPlayer.play()
       }
       

}

