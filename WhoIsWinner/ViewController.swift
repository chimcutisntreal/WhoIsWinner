//
//  ViewController.swift
//  WhoIsWinner
//
//  Created by Chinh on 2/12/19.
//  Copyright © 2019 Chinh. All rights reserved.
//

import UIKit
import Pastel
import Firebase


class ViewController: UIViewController, GADBannerViewDelegate {
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberPButton: NumberPlayersButton!
    
    var numberView: UIView!
    var isClickedAgain = false
    var isReceived = false
    override func viewDidLoad() {
        super.viewDidLoad()
        customTitleLabel()
        setGradient()
        
        bannerView?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView?.delegate = self
        bannerView?.rootViewController = self
        bannerView?.load(GADRequest())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
 

    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        isReceived = true
        print("Banner Received")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ad with error: \(error)")
    }
    
    func customTitleLabel(){
        titleLabel.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        titleLabel.layer.borderWidth = 1.5
        titleLabel.layer.cornerRadius = self.titleLabel.frame.height/2
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontForContentSizeCategory = true
        
    }
    
    
    @IBAction func pressOnNP(_ sender: Any) {
        if isReceived == true {
            if isClickedAgain == false {
                UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
                    
                    let scaleOrigin = CGAffineTransform(scaleX: 0.3, y: 0.3)
                    let rotationOrigin = CGAffineTransform(rotationAngle: .pi)
                    self.numberPButton.transform = scaleOrigin.concatenating(rotationOrigin)
                    self.numberPButton.frame.origin.x += 130
                    self.numberPButton.frame.origin.y += 230
                   
                })
                
                isClickedAgain = true
            } else {
                UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
                    
                    self.numberPButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.numberPButton.frame.origin.x -= 130
                    self.numberPButton.frame.origin.y -= 230
                    
                })
                self.numberPButton.setTitle("Number Of Players", for: .normal)
                self.numberPButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 18)
                isClickedAgain = false
            }
        } else {
            print("have not received banner yet")
        }
        
    }
    
}

extension UIViewController {
    func setGradient(){
        let pastelView = PastelView(frame: view.bounds)
        
        //        // Custom Direction
        //        pastelView.startPastelPoint = .bottomRight
        //        pastelView.endPastelPoint = .topLeft
        //
        // Custom Duration
        pastelView.animationDuration = 20.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 19/255, green: 78/255, blue: 94/255, alpha: 1.0),
                              UIColor(red: 13/255, green: 178/255, blue: 128/255, alpha: 1.0),
                              UIColor(red: 117/255, green: 58/255, blue: 136/255, alpha: 1.0),
                              UIColor(red: 204/255, green: 43/255, blue: 94/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
    }
}

