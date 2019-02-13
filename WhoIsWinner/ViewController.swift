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
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var numberView: UIView!
    var isReceived = false
    override func viewDidLoad() {
        super.viewDidLoad()
        customTitleLabel()
        setGradient()
        
        bannerView?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView?.delegate = self
        bannerView?.rootViewController = self
        bannerView?.load(GADRequest())
        
        cancelButton.isHidden = true
        doneButton.isHidden = true
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
//            self.numberPButton.isHidden = true
            self.cancelButton.isHidden = false
            self.doneButton.isHidden = false
            UIView.animate(withDuration: 0.4, animations: {
                let scaleCancel = CGAffineTransform(scaleX: 0.25, y: 0.25)
                let rotationCancel = CGAffineTransform(rotationAngle: .pi)
                let translationCancel = CGAffineTransform(translationX: 130, y: 230)
                self.cancelButton.transform = scaleCancel.concatenating(rotationCancel).concatenating(translationCancel)
                
                let scaleDone = CGAffineTransform(scaleX: 0.25, y: 0.25)
                let rotationDone = CGAffineTransform(rotationAngle: .pi)
                let translationDone = CGAffineTransform(translationX: -130, y: 230)
                self.doneButton.transform = scaleDone.concatenating(rotationDone).concatenating(translationDone)
                self.doneButton.image(for: .normal)
                
                self.cancelButton.alpha = 1
                self.doneButton.alpha = 1
                self.numberPButton.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -200)
            })

        } else {
            print("have not received banner yet")
        }
    }
    @IBAction func pressOnCancel(_ sender: Any) {
        UIView.animate(withDuration: 0.4, animations: {
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.doneButton.transform = CGAffineTransform(translationX: 0, y: 0)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            
        })
        UIView.animate(withDuration: 0.3, delay: 0.3, animations: {
            self.cancelButton.alpha = 0
            self.doneButton.alpha = 0
            self.numberPButton.alpha = 1
        })
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
extension UIButton {
    func customCancelButton(){
        self.layer.borderWidth = 3
        self.layer.shadowRadius = 50
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}

