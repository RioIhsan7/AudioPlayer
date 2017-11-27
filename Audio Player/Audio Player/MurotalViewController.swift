//
//  MurotalViewController.swift
//  Audio Player
//
//  Created by Rio_Ihsan on 9/23/17.
//  Copyright © 2017 mac os. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MurotalViewController: UIViewController {

    @IBOutlet weak var artistMurotal: UILabel!
    @IBOutlet weak var titleMurotal: UILabel!
    @IBOutlet weak var progressView: UISlider!
    @IBOutlet weak var coverImageView: UIImageView!
    
    var trackId : Int = 0
    var library = Murotal().library
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let coverImage = library[trackId]["coverImage"] {
            coverImageView.image = UIImage(named: "\(coverImage).png")
            
        }
        titleMurotal.text = library[trackId]["title"] as! String
        artistMurotal.text = library[trackId]["artist"] as! String
        
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MurotalViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setValue(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }

        // Do any additional setup after loading the view.
    }
    func updateProgressView(){
        
    }

    @IBAction func btnFastForward(_ sender: Any) {
        if trackId == 0 || trackId < library.count {
            trackId += 1
        }
        if let coverImage = library[trackId]["coverImage"] {
            coverImageView.image = UIImage(named: "\(coverImage).png")
        }
        titleMurotal.text = library[trackId]["title"] as! String
        artistMurotal.text = library[trackId]["artist"] as! String
        
        if let coverImage = library[trackId]["coverImage"] {
            coverImageView.image = UIImage(named: "\(coverImage).png")
            
        }
        titleMurotal.text = library[trackId]["title"] as! String
        artistMurotal.text = library[trackId]["artist"] as! String
        
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MurotalViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setValue(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }
    @IBAction func btnRedo(_ sender: Any) {
        var time : TimeInterval = audioPlayer.currentTime
        time -= 5.0
        if time > audioPlayer.duration {
            btnStop(self)
        } else {
            audioPlayer.currentTime = time
        }
        
    }
    @IBAction func btnPause(_ sender: Any) {
        audioPlayer.pause()
    }
    @IBAction func btnRewind(_ sender: Any) {
        if trackId != 0 || trackId > 0 {
            trackId -= 1
        }
        if let coverImage = library[trackId]["coverImage"] {
            coverImageView.image = UIImage(named: "\(coverImage).png")
        }
        titleMurotal.text = library[trackId]["title"] as! String
        artistMurotal.text = library[trackId]["artist"] as! String
        
        if let coverImage = library[trackId]["coverImage"] {
            coverImageView.image = UIImage(named: "\(coverImage).png")
            
        }
        titleMurotal.text = library[trackId]["title"] as! String
        artistMurotal.text = library[trackId]["artist"] as! String
        
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
        if let path = path {
            let mp3URL = NSURL(fileURLWithPath: path)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MurotalViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setValue(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }

    }
    @IBAction func btnUndo(_ sender: Any) {
        var time : TimeInterval = audioPlayer.currentTime
        time -= 5.0
        if time < 0 {
            btnStop(self)
        } else {
            audioPlayer.currentTime = time
        }
    }
    @IBAction func btnStop(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        
        }
    @IBAction func btnPlay(_ sender: Any) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
