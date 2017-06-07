//
//  ViewController.swift
//  den led
//
//  Created by duy phương on 6/6/17.
//  Copyright © 2017 duy phương. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var margin:CGFloat = 20
    var n:Int!
    var chon:UITextField!
    var ball:UIImageView!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        addBall()
        count = 0
        addText()
        addDraw()
    }
    
    func addBall() {
        var dem = 0
        for indexHang in 0..<n{
            for indexCot in 0..<n{
                dem = dem + 1
                 ball = UIImageView(frame: CGRect(x: margin + CGFloat(indexHang) * spaceBetwenCot(), y: 100 + CGFloat(indexCot)*spaceBetwenHang(), width: 40, height: 40))
                ball.image = UIImage(named: "green")
                ball.tag = 50 + dem
                self.view.addSubview(ball)
            }
        }
        
    }
    
    func spaceBetwenCot() -> CGFloat {
        let space = ((self.view.bounds.size.width - margin * 2 - 40)/(CGFloat(n-1)) )
        return space
    }
    func spaceBetwenHang() -> CGFloat {
        let space = ((self.view.bounds.size.height - margin * 2 - 140)/(CGFloat(n-1)) )
        return space
    }
    
    func addText() {
        chon = UITextField(frame: CGRect(x: 20, y: 50, width: 70, height: 30))
        chon.text = ""
        chon.borderStyle = UITextBorderStyle.line
        self.view.addSubview(chon)
        
    }
    
    func addDraw() {
        let draw = UIButton(frame: CGRect(x: 100, y: 50, width: 50, height: 30))
        draw.setTitle("Draw", for: .normal)
        draw.backgroundColor = UIColor.green
        draw.addTarget(self, action: #selector(acction(sender:)), for: .touchUpInside)
        self.view.addSubview(draw)
    }
    
    func acction(sender: UIButton!) {
        if count == 0{
            n = Int(chon.text!)
            addBall()
            count = 1
        }
        else{
        n = Int(chon.text!)
        resetDraw()
        addBall()
        }
        
    }
    
    func resetDraw(){
        
        let rsDraw = self.view.subviews
        for ball in rsDraw {
            
            if ball.tag >= 50  {
                ball.removeFromSuperview()
            }else{
                print("New")
            }
        }
}
}
