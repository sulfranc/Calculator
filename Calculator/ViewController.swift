//
//  ViewController.swift
//  Calculator
//
//  Created by JayGuapo on 2/16/18.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var calculatorView: UILabel!
    var firstNumberSet : String = "0"
    var secondNumberSet : String = "0"
    var performingMath = false
    var result : Double = 0
    var operation = "/"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }


    @IBAction func touchNumButtons(_ sender: UIButton) {
        if calculatorView.text!.count <= 11{
            if calculatorView.text == "0"{
                calculatorView.text?.remove(at: (calculatorView.text?.startIndex)!)
            }
            if performingMath == true{
                calculatorView.text! += String(sender.tag)
                secondNumberSet = calculatorView.text!
                performingMath = false
            }
            else{
                calculatorView.text! += String(sender.tag)
            }
        }
    }
    
    @IBAction func periodButton(_ sender: UIButton) {

        if calculatorView.text?.range(of: ".") == nil{
            calculatorView.text! += "."
        }
        else{
            calculatorView.text! += ""
        }
       
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        if calculatorView.text! == "0"{
            calculatorView.text! += ""
        }
        else{
            if sender.tag == 10{
                calculatorView.text! += "0"
            }
        }
    }
    
    @IBAction func operators(_ sender: UIButton) {
        if calculatorView.text != ""{
            firstNumberSet = calculatorView.text!
            calculatorView.text = ""
            performingMath = true
            
            if sender.tag == 20{//Divide
                operation = "/"
            }
           else if sender.tag == 21{//Multiply
                operation = "*"
                
            }
            else if sender.tag == 22{//Subtract
                operation = "-"
                
            }
            else if sender.tag == 23{//Add
                operation = "+"
              
            }
            
        }
        
    }
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        secondNumberSet = calculatorView.text!
        switch operation {
        case "*":if Double(firstNumberSet) != nil && Double(secondNumberSet) != nil{
            result = Double(firstNumberSet)! * Double(secondNumberSet)!
        }
            break
        case "-":if Double(firstNumberSet) != nil && Double(secondNumberSet) != nil{
            result = Double(firstNumberSet)! - Double(secondNumberSet)!
        }
            break
        case "+": if Double(firstNumberSet) != nil && Double(secondNumberSet) != nil{
            result = Double(firstNumberSet)! + Double(secondNumberSet)!
        }
            break

        default:if Double(firstNumberSet) != nil && Double(secondNumberSet) != nil{
            result = Double(firstNumberSet)! / Double(secondNumberSet)!
        }
            break
        }
        if result == 0 {
            result = 0
        
        }
      
            calculatorView.text = String(result)
        
       
      
    }
  
    @IBAction func clearButton(_ sender: UIButton) {
        calculatorView.text = "0"
        firstNumberSet = "0"
        secondNumberSet = "0"
        result = 0
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        if calculatorView.text != "" && calculatorView.text != "-"{
            calculatorView.text = String(Double(calculatorView.text!)! / 100)
        }
    }
    
    @IBAction func negativeOrPositive(_ sender: UIButton) {
        if  calculatorView.text == "0"{
            calculatorView.text?.remove(at: (calculatorView.text?.startIndex)!)
        }
        if calculatorView.text == "0"{
            calculatorView.text?.insert("-", at:(calculatorView.text?.startIndex)!)
        }
        if calculatorView.text?.range(of: "-") == nil{
           calculatorView.text?.insert("-", at: (calculatorView.text?.startIndex)!)
        }
        else {
            calculatorView.text?.remove(at: (calculatorView.text?.startIndex)!)
            }
            
        
    }
}


