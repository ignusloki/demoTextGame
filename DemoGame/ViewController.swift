//
//  ViewController.swift
//  DemoGame
//
//  Created by Felipe on 24/01/2016.
//  Copyright © 2016 fastman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTypeWriter: UILabel!
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    
    @IBAction func firstSelected(sender: UIButton) {
        
    }
    
    @IBAction func secondSelected(sender: UIButton) {
        
    }
    
    @IBAction func thirdSelected(sender: UIButton) {
        
    }
    
    var myText = Array("".characters)
    
    var myCounter = 0
    var timer:NSTimer?
    var actualScene : Int8 = 1
    var nextScene : Int8 = 2
    var villanScene : [String] = []
    var villanSpeech : String = ""
    
    func sceneVillan(scene : Int8){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "typeLetter", userInfo: nil, repeats: true)
    }
    
    func sceneChoices(){
        
        firstOption.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        firstOption.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //firstOption.setTitle(scriptScene[1], forState: .Normal)
        secondOption.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        secondOption.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //secondOption.setTitle(scriptScene[2], forState: .Normal)
        thirdOption.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
        thirdOption.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //thirdOption.setTitle(scriptScene[3], forState: .Normal)
        
    }
    
    func typeLetter(){
        if myCounter < myText.count {
            myTypeWriter.text = myTypeWriter.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(8)+1))/1000
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(randomInterval, target: self, selector: "typeLetter", userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter++
        
        if myCounter > myText.count {
            sceneChoices()
        }
        
    }
    
    func villanUI(phrase:[String]) {
        
        for var index = 0; index < phrase.count; index++ {
            
            let label = UILabel(frame: CGRectMake(10, 20 + (CGFloat(index) * 50), 300, 50))
            label.lineBreakMode = .ByWordWrapping
            label.numberOfLines = 0
            label.backgroundColor = UIColor.whiteColor()
            label.textAlignment = NSTextAlignment.Left
            label.font = UIFont(name: "Arial", size: 12)
            label.textColor = UIColor.blackColor()
            label.text = phrase[index]
            self.view.addSubview(label)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        villanScene = loadJsonScene()
        villanUI(villanScene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}