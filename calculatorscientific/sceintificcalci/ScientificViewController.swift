//
//  ScientificViewController.swift
//  sceintificcalci
//
//  Created by Venkatesh K on Saka 1940-07-27.
//  Copyright © 1940 Saka Venkatesh K. All rights reserved.
//

import UIKit

class ScientificViewController: UIViewController {

    @IBOutlet weak var lblValue: UILabel!
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var performingMath2 = false;
    var isEqulAction = false;
    var isFloatingAction = false;
    var operation = 0;
    
    @IBOutlet weak var btn10Pow2: UIButton!
    @IBOutlet weak var btnXPow3: UIButton!
    @IBOutlet weak var btnXPow2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //btnXPow2.setTitle("X\u00B2", "2", for: .normal)
        
        let font:UIFont? = UIFont(name: "Helvetica", size:22)
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:13)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "x2", attributes: [.font:font!])
        attString.setAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:0,length:attString.length))
        attString.setAttributes([.font:fontSuper!,kCTSuperscriptAttributeName as NSAttributedStringKey : 1 ,NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:1,length:1))
        btnXPow2.setAttributedTitle(attString, for: .normal)
        
        let font2:UIFont? = UIFont(name: "Helvetica", size:22)
        let fontSuper2:UIFont? = UIFont(name: "Helvetica", size:13)
        let attString2:NSMutableAttributedString = NSMutableAttributedString(string: "x3", attributes: [.font:font2!])
        
        attString2.setAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:0,length:attString.length))
        attString2.setAttributes([.font:fontSuper2!,kCTSuperscriptAttributeName as NSAttributedStringKey : 1 ,NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:1,length:1))
        btnXPow3.setAttributedTitle(attString2, for: .normal)
        
        let font3:UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSuper3:UIFont? = UIFont(name: "Helvetica", size:15)
        let attString3:NSMutableAttributedString = NSMutableAttributedString(string: "10x")
        attString3.setAttributes([.font:fontSuper3!,kCTSuperscriptAttributeName as NSAttributedStringKey  : 1 ,NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:2,length:1))
        attString3.setAttributes([.font:font3!,NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:0,length:2))
        btn10Pow2.setAttributedTitle(attString3, for: .normal)
        
        
        
    }
    
    @IBAction func calculations(_ sender: UIButton) {
        
        
        
        
        if sender.tag >= 0 && sender.tag <= 9 {
            if isFloatingAction == true
            {
                lblValue.text = lblValue.text! + String(sender.tag)
                numberOnScreen = Double(lblValue.text!)!
            }  else {
                if lblValue.text == "0"
                {
                    lblValue.text = String(sender.tag)
                }else
                {
                    lblValue.text = lblValue.text! + String(sender.tag)
                }
                numberOnScreen = Double(lblValue.text!)!
            }
        } else  if sender.tag == 10 && lblValue.text != "" {
            
            if ((lblValue.text! as NSString).range(of: ".") as NSRange).length == 0
            {
                isFloatingAction = true
                lblValue.text =  lblValue.text! + "."
                numberOnScreen = Double(lblValue.text!)!
            }
            
        } else
        {
            isFloatingAction = false
            switch sender.tag {
            case 19:
                if lblValue.text != "0" {
                    lblValue.text = String(1/sin(numberOnScreen))
                    numberOnScreen = Double(lblValue.text!)!
                }
            case 18:
                lblValue.text = "0"
                numberOnScreen = 0
            case 17:
                lblValue.text = String(sin(numberOnScreen))
                numberOnScreen = Double(lblValue.text!)!
            case 16:
                lblValue.text = String(cos(numberOnScreen))
                numberOnScreen = Double(lblValue.text!)!
            case 15:
                lblValue.text = String(tan(numberOnScreen))
                numberOnScreen = Double(lblValue.text!)!
            case 14:
                lblValue.text = String(pow(numberOnScreen, 2))
                numberOnScreen = Double(lblValue.text!)!
            case 13:
                lblValue.text = String(pow(numberOnScreen, 3))
                numberOnScreen = Double(lblValue.text!)!
            case 12:
                lblValue.text = String(pow(10, numberOnScreen))
                numberOnScreen = Double(lblValue.text!)!
            case 11:
                lblValue.text = String(1/cos(numberOnScreen))
                numberOnScreen = Double(lblValue.text!)!
            default:
                isFloatingAction = false
            }
            
        }
    }
    
    
    
}

