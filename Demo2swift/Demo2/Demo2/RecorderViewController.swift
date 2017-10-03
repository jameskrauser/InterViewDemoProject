//
//  RecorderViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/2.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit
import AVFoundation

enum AudioSessionMode {
    case record
    case play
}


class RecorderViewController: UIViewController , AVAudioRecorderDelegate {
    
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isRecording = false
    
    func settingAudioSession(mode:AudioSessionMode){
        let session = AVAudioSession.sharedInstance()
        do{
            switch mode {
                case .record:
                    try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
                case .play:
                    try session.setCategory(AVAudioSessionCategoryPlayback)
                    try session.setActive(false)
            }
        }catch{
            print(error.localizedDescription)
        }
    }

    @IBAction func StartRecording(_ sender: UIButton) {
       settingAudioSession(mode: .record)
       audioRecorder?.prepareToRecord()
       audioRecorder?.record()
       isRecording = true
    }
    
    @IBAction func StopRecording(_ sender: UIButton) {
        audioRecorder?.stop()
        isRecording = false
        settingAudioSession(mode: .play)
    }
    
    @IBAction func startPlaying(_ sender: UIButton) {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
            audioPlayer?.play()
        }
    }
    @IBAction func StopPlaying(_ sender: UIButton) {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true {
            
            do{
                  audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            }catch{
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let filename = "User.wav"
        let path = NSHomeDirectory() + "/Documents" + filename
        let url = URL(fileURLWithPath: path)
        let recordSettings:[String:Any] = [
            AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue ,
            AVEncoderBitRateKey: 16 ,
            AVNumberOfChannelsKey: 2 ,
            AVSampleRateKey: 44100.0
        ]
        do{
                audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
                audioRecorder?.delegate = self
        }catch{
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
