//
// ViewController.swift
//
// Created by Patrick Coxall on 2016-10-05.
// This program shows basic UIKit elements working in an iPad Playground
//

// Edited by Alireza Teimoori
// Edited on 5 Nov 2017
// This code uses Mr.Coxall's template to play simple 21 with player

import UIKit

// comment out line below and one at bottom, to make code work in Xcode
import Foundation
import PlaygroundSupport

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var userLabel : UILabel!
    var comLabel : UILabel!
    
    var userCardOne : UILabel!
    var userCardTwo : UILabel!
    var userCardThree : UILabel!
    var comCardOne : UILabel!
    var comCardTwo : UILabel!
    
    var userFirstcardLabel : UILabel!
    var userSecondcardLabel : UILabel!
    var userThirdcardLabel : UILabel!
    var comFirstcardLabel : UILabel!
    var comSecondcardLabel : UILabel!
    
    var userSumLabel : UILabel!
    var comSumLabel : UILabel!
    
    var hitButton : UIButton!
    var standButton : UIButton!
    
    var winLoseLabel : UILabel!
    
    var userFirstCard = arc4random_uniform(10)
    var userSecondCard = arc4random_uniform(10)
    var userThirdCard : UInt32? = nil
    var comFirstCard = arc4random_uniform(10)
    var comSecondCard = arc4random_uniform(10)
    var userSum : UInt32? = nil
    var comSum : UInt32? = nil
    
    override func viewDidLoad() {
        // declare some of the variables that are not declareable in properties 
        var userSum = userFirstCard + userSecondCard
        var comSum = comFirstCard + comSecondCard 
        
        // create the UIView
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        self.view = view
        
        // create all the UIElements
        userLabel = UILabel(frame: CGRect(x: 450, y: 500, width: 500, height: 50))
        userLabel.text = "YOU"
        view.addSubview(userLabel)
        
        comLabel = UILabel(frame: CGRect(x: 450, y: 5, width: 500, height: 50))
        comLabel.text = "COM"
        view.addSubview(comLabel)
        
        userCardOne = UILabel(frame: CGRect(x: 200, y: 400, width: 500, height: 50))
        userCardOne.text = "Card One"
        view.addSubview(userCardOne)
        
        userCardTwo = UILabel(frame: CGRect(x: 450, y: 400, width: 500, height: 50))
        userCardTwo.text = "Card Two"
        view.addSubview(userCardTwo)
        
        userCardThree = UILabel(frame: CGRect(x: 700, y: 400, width: 500, height: 50))
        userCardThree.text = ""
        view.addSubview(userCardThree)
        
        
        comCardOne = UILabel(frame: CGRect(x: 200, y: 50, width: 500, height: 50))
        comCardOne.text = "Card One"
        view.addSubview(comCardOne)
        
        comCardTwo = UILabel(frame: CGRect(x: 700, y: 50, width: 500, height: 50))
        comCardTwo.text = "Card Two"
        view.addSubview(comCardTwo)
        
        userFirstcardLabel = UILabel(frame: CGRect(x: 200, y: 440, width: 500, height: 50))
        userFirstcardLabel.text = String(describing: userFirstCard)
        view.addSubview(userFirstcardLabel)
        
        userSecondcardLabel = UILabel(frame: CGRect(x: 450, y: 440, width: 500, height: 50))
        userSecondcardLabel.text = String(describing: userSecondCard)
        view.addSubview(userSecondcardLabel)
        
        userThirdcardLabel = UILabel(frame: CGRect(x: 700, y: 440, width: 500, height: 50))
        userThirdcardLabel.text = ""
        view.addSubview(userThirdcardLabel)
        
        
        comFirstcardLabel = UILabel(frame: CGRect(x: 200, y: 90, width: 500, height: 50))
        comFirstcardLabel.text = String(describing: comFirstCard)
        view.addSubview(comFirstcardLabel)
        
        comSecondcardLabel = UILabel(frame: CGRect(x: 700, y: 90, width: 500, height: 50))
        comSecondcardLabel.text = String(describing: comSecondCard)
        view.addSubview(comSecondcardLabel)
        
        
        userSumLabel = UILabel(frame: CGRect(x: 450, y: 350, width: 500, height: 50))
        userSumLabel.text = String(describing: userSum)
        view.addSubview(userSumLabel)
        
        comSumLabel = UILabel(frame: CGRect(x: 450, y: 130, width: 500, height: 50))
        comSumLabel.text = String(describing: comSum)
        view.addSubview(comSumLabel)
        
        
        
        hitButton = UIButton(frame: CGRect(x: 250, y: 300, width: 100, height: 50))
        hitButton.setTitle("HIT!", for: UIControlState.normal)
        hitButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        hitButton.addTarget(self, action: #selector(hitButtonTouchUpInside), for: UIControlEvents.touchUpInside)
        view.addSubview(hitButton)
        
        
        standButton = UIButton(frame: CGRect(x: 550, y: 300, width: 100, height: 50))
        standButton.setTitle("STAND!", for: UIControlState.normal)
        standButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        standButton.addTarget(self, action: #selector(standButtonTouchUpInside), for: UIControlEvents.touchUpInside)
        view.addSubview(standButton)
        
        winLoseLabel = UILabel(frame: CGRect(x: 450, y: 230, width: 500, height: 50))
        winLoseLabel.text = "***"
        view.addSubview(winLoseLabel)
        
    }
    
    @objc func hitButtonTouchUpInside() {
        // runs when user touches hit button
        userThirdCard = arc4random_uniform(10)
        userCardThree.text = "Third Card"
        userThirdcardLabel.text = String(describing: userThirdCard)
        userSum = userFirstCard + userSecondCard + userThirdCard!
        userSumLabel.text = String(describing: userSum)
        
    }
    
    @objc func standButtonTouchUpInside() {
        // runs when user touches stand button
        
        if userSum! > 21{
            winLoseLabel.text = "YOU LOSE!!!"
        }else if userSum! > comSum! {
            winLoseLabel.text = "YOU Win!!!"
        }else{
            winLoseLabel.text = "YOU LOSE!!!"
        }
    }
    
    
    
    
    // this is for when code is moved to Xcode, the Status bar will be removed
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// need to also comment this out to make work in Xcode
PlaygroundPage.current.liveView = ViewController()

