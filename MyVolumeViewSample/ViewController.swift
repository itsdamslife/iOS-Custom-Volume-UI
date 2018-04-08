//
//  ViewController.swift
//  MyVolumeViewSample
//
//  Created by Damodar Shenoy on 4/8/18.
//  Copyright © 2018 itsdamslife. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    // vout
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // dmp
        let dummyVolumeView = MPVolumeView(frame: volumeSlider.frame)
        dummyVolumeView.isHidden = false
        dummyVolumeView.alpha = 0.01
        dummyVolumeView.backgroundColor = UIColor.clear
        view.addSubview(dummyVolumeView)
        
        // smp
        self.volumeView.alpha = 0.0
        self.view.bringSubview(toFront: self.volumeView)
        
        // vcn
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(volumeDidChange(notification:)),
                                               name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"),
                                               object: nil)
        

    }

    // vcm
    @objc func volumeDidChange(notification: NSNotification) {
        
        let volume = notification.userInfo!["AVSystemController_AudioVolumeNotificationParameter"] as! Float
        self.volumeView.alpha = 1.0
        volumeSlider.value = volume
        
        UIView.animate(withDuration: 0.8,
                       delay: 3,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        self?.volumeView.alpha = 0.0
                       }, completion: nil)
    }

}

