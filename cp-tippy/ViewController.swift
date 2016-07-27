//
//  ViewController.swift
//  cp-tippy
//
//  Created by Allen Wong on 7/11/16.
//  Copyright © 2016 Allen Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var outputView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmtLabel: UILabel!
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var outputUI: UIView!
    
    
    @IBOutlet weak var tip01Label: UILabel!
    @IBOutlet weak var tip02Label: UILabel!
    @IBOutlet weak var tip03Label: UILabel!
    @IBOutlet weak var tip04Label: UILabel!
    @IBOutlet weak var tipCustomField: UITextField!
    @IBOutlet weak var tipCustomLabel: UILabel!
    
    @IBOutlet weak var tipCustomValLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var customTipTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        outputView.alpha = 0
        //tipLabel.center = CGPoint(x:255,y:250)
        tipLabel.hidden = true
        segmentView.alpha = 0
        customTipTextLabel.alpha = 0
        billField.center = CGPoint(x:180,y:250)
        tipTextLabel.center = CGPoint (x:65,y:40)
        totalTextLabel.center = CGPoint (x:65,y:90)
        tipAmtLabel.center = CGPoint (x:170, y:40)
        totalLabel.center = CGPoint (x:170,y:90)
        tipCustomValLabel.hidden = true
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onEditingChange(sender: AnyObject) {
    
        customTipTextLabel.alpha = 0
        tipCustomValLabel.hidden = true
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.billField.center = CGPoint(x: 180, y: 120)
            self.outputView.alpha = 1
            self.segmentView.center = CGPoint(x:160, y:180)
            self.segmentView.alpha = 1
            

        })
        
        let tipPercentages = [0.1,0.15,0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[segmentView.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmtLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        tip01Label.text = String(format: "$%.2f", total)
        tip02Label.text = String(format: "$%.2f", total/2)
        tip03Label.text = String(format: "$%.2f", total/3)
        tip04Label.text = String(format: "$%.2f", total/4)
        
        
    }
    @IBAction func calcCustomSplit(sender: AnyObject) {
        
        
        let tipPercentages = [0.1,0.15,0.2]
        
        let tipCustom = Double(tipCustomField.text!) ?? 0
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[segmentView.selectedSegmentIndex]
        let total = bill + tip
        let tipCustomAmt = total/tipCustom
   
        
        if tipCustomAmt < 0 || tipCustomAmt.isInfinite{
            tipCustomLabel.text = "$0.00"
        } else {
        
        tipCustomLabel.text = String(format: "$%.2f",tipCustomAmt)
        }
    }
    
    @IBAction func customSplitOnTouch(sender: AnyObject) {
        tipCustomValLabel.hidden = false
        
        UIView.animateWithDuration(0.4, animations: {
            self.tipTextLabel.center = CGPoint(x: 60, y: 25)
            self.totalTextLabel.center = CGPoint(x: 60, y: 65)
            self.tipAmtLabel.center = CGPoint (x:170, y:25)
            self.totalLabel.center = CGPoint (x:170,y:65)
            self.customTipTextLabel.alpha = 1
            //self.tipTextLabel.font = self.tipTextLabel.font.fontWithSize(14)
        })
        
   
    }
    @IBAction func displaySplitAmt(sender: AnyObject) {
        let tipValue = Int(tipCustomField.text!) ?? 0
        tipCustomValLabel.text = String(tipValue)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        customTipTextLabel.alpha = 0
        tipCustomValLabel.hidden = true
        tipLabel.hidden = false
        if billField.text == ""   {
            customTipTextLabel.alpha = 0
            self.tipLabel.center = CGPoint(x: 255, y: 250)
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
            self.tipLabel.hidden = false
            
            self.billField.center = CGPoint(x:180,y:250)
            self.outputView.alpha = 0
            self.segmentView.alpha = 0
       
           
            })
        } else {
            customTipTextLabel.alpha = 0
            self.outputView.alpha = 1
            self.segmentView.alpha = 1
            self.tipLabel.hidden = true
            self.tipTextLabel.center = CGPoint (x:65,y:40)
            self.totalTextLabel.center = CGPoint (x:65,y:90)
            self.tipAmtLabel.center = CGPoint (x:170, y:40)
            self.totalLabel.center = CGPoint (x:170,y:90)
           
        }
    }
    
    @IBAction func onTouchDown(sender: AnyObject) {
        customTipTextLabel.alpha = 0
        tipCustomValLabel.hidden = true
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.hidden = true
            self.billField.center = CGPoint(x: 180, y: 120)
            self.segmentView.center = CGPoint(x:160, y:180)
            self.outputView.alpha = 1
            self.segmentView.alpha = 1
            
        })
    }
    

    /*
    // Optionally initialize the property to a desired starting value
    self.mainView.alpha = 0
    self.secondView.alpha = 1
    UIView.animateWithDuration(0.4, animations: {
    // This causes first view to fade in and second view to fade out
    self.mainView.alpha = 1
    self.secondView.alpha = 0
    })
    */



}

