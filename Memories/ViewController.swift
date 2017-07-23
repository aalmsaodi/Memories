//
//  ViewController.swift
//  Memories
//
//  Created by user on 7/22/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var helpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func requestPhotoPermission(){
        PHPhotoLibrary.requestAuthorization { [unowned self] authStatus in
            
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.requestRecordPermission()
                    
                } else {
                    self.helpLabel.text = "Photo Permisson was denied. Please enable Photo permission manually from Settings then press continue again"
                }
            }
        }
    }
    
    func requestRecordPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission() { [unowned self] allowd in
            DispatchQueue.main.async {
                if allowd {
                    self.requestTranscripePermissin()
                    
                } else {
                    self.helpLabel.text = "Record Permisson was denied. Please enable Photo permission manually from Settings then press continue again"
                }
            }
        }
    }
    
    func requestTranscripePermissin() {
        SFSpeechRecognizer.requestAuthorization(){ [unowned self] authStatus in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                self.authorizationComplete()
                
                } else {
                self.helpLabel.text = "Transcription Permisson was denied. Please enable Photo permission manually from Settings then press continue again"
                }
            }
        }
    }
    
    func authorizationComplete() {
        dismiss(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestPermissions(_ sender: Any) {
        requestPhotoPermission()
    }

}

