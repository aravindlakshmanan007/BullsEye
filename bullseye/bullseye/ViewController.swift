//
//  ViewController.swift
//  bullseye
//
//  Created by Aravind on 23/10/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var current:Int=50
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetlabel:UILabel!
    var random:Int=0
    var score:Int=0
    var round:Int=0
    @IBOutlet weak var scorelabel:UILabel!
    @IBOutlet weak var roundlabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        current=Int(slider.value)
        newround()
    }
    
    @IBAction func slidermoved(slider:UISlider){
        current=Int(slider.value)
    }
    @IBAction func startover(){
        score=0
        round=0
        newround()
    }
    func updatelabel(){
        targetlabel.text=String(random)
        scorelabel.text=String(score)
        roundlabel.text=String(round)
    }
    func newround(){
        random=Int(arc4random_uniform(100))
        current=50
        slider.value=Float(current)
        round=round+1
        updatelabel()
    }
    @IBAction func info(){
        let alert=UIAlertController(title: "Game Info", message: "Drag the slider nearer to the target value and press the hit button and get your score...", preferredStyle: .alert)
        let action=UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    @IBAction  func showalert()  {
        var difference:Int=0
        if current>random{
            difference=current-random
        }else if random>current{
            difference=random-current
        }
        else{
            difference=0
        }
        score=score+difference
        let alert=UIAlertController(title: "Current value", message: "You scored \(difference) in this round", preferredStyle: .alert)
        let action=UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        newround()
    }
}

