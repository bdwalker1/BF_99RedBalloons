//
//  Balloon.swift
//  BF_99RedBalloons
//
//  Created by Bruce Walker on 3/19/15.
//  Copyright (c) 2015 Bruce D Walker. All rights reserved.
//

import Foundation
import UIKit

struct Balloon
{
    var image = UIImage(named: "")
    var name:String = ""
    var imageName:String = ""
    
    func createBalloon(nNumber:Int, strLastImage:String) -> Balloon
    {
        var balloon:Balloon = Balloon()
        
        balloon.name = "Balloon \(nNumber)"
        
        var strImageName = ""
        switch (nNumber)
        {
        case 99:
            strImageName = "RedBalloon99.jpg"
        default:
            do
            {
                var nRandIndex = Int( arc4random_uniform(UInt32(10))) + 1
                strImageName = "RedBalloon\(nRandIndex).jpg"
            } while strImageName == strLastImage
        }
        balloon.imageName = strImageName
        balloon.image = UIImage(named: strImageName)

        return balloon
    }
    
    func createBalloonArray(nCount:Int) -> [Balloon]
    {
        var balloons:[Balloon] = []
        for (var n=0;n<nCount;n++)
        {
            var strLastImage = ""
            if (n>0)
            {
                strLastImage = balloons[balloons.count-1].imageName
            }
            balloons.append(self.createBalloon(n+1, strLastImage: strLastImage))
        }
        return balloons
    }
}