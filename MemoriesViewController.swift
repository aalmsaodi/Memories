//
//  MemoriesViewController.swift
//  Memories
//
//  Created by user on 7/22/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech

class MemoriesViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func checkPermissions(){
        
        let photoAuthorized = PHPhotoLibrary.authorizationStatus() == .authorized
        let recordAuthorized = AVAudioSession.sharedInstance().recordPermission() == .granted
        let transcripeAuthorized = SFSpeechRecognizer.authorizationStatus() == .authorized
        
        let authorized = photoAuthorized && recordAuthorized && transcripeAuthorized
        
        if authorized == false {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FirstRun") {
                
                navigationController?.present(vc, animated: true)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        checkPermissions()
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
