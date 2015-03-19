//
//  ViewController.swift
//  BF_99RedBalloons
//
//  Created by Bruce Walker on 3/18/15.
//  Copyright (c) 2015 Bruce D Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBalloon: UIImageView!
    @IBOutlet weak var lblBalloon: UILabel!
    
    var balloons:[Balloon] = []
    var nCurrentBalloon:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var balloon:Balloon = Balloon()
        self.balloons = balloon.createBalloonArray(99)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressNext(sender: UIBarButtonItem) {
//        var nBalloon:Int
//        do
//        {
//            nBalloon = Int(arc4random_uniform(UInt32(self.balloons.count)))
//        } while nBalloon == nCurrentBalloon
//        nCurrentBalloon = nBalloon
        
        if (++nCurrentBalloon>=self.balloons.count)
        {
            nCurrentBalloon = 0
        }

        UIView.transitionWithView(self.view, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:  {
            self.updateBalloon(self.nCurrentBalloon)
            }, completion: { (finished: Bool) -> () in } )
    }
    
    func updateBalloon(nIndex:Int)
    {
        self.imgBalloon.image = balloons[nIndex].image
        self.lblBalloon.text = balloons[nIndex].name
    }

}

