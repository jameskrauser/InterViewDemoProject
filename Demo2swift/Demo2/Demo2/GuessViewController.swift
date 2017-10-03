//
//  GuessViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/1.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {

    //@IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var MessageLabel: UILabel!
    
    //@IBOutlet weak var Inputtext: UITextField!
    
    @IBOutlet weak var Inputttext: UITextField!
    
    var answer = Int(arc4random_uniform( 100 ) + 1 )
    var minNumber:Int = 1
    var maxNumber:Int = 100
    var isOver = false
    
    
    
    @IBAction func GuessNumber(_ sender: UIButton) { ///  end of button
        if isOver == false {
            let inputText = Inputttext.text!
            let inputNumber = Int(inputText)
            print("ans is \(answer)")
            
            Inputttext.text = ""
            if inputNumber == nil {
                MessageLabel.text = "no input! guess number between \(minNumber)~\(maxNumber)"
            }else {
                if inputNumber! > maxNumber {
                    
                    MessageLabel.text = "too large,guess number between \(minNumber)~\(maxNumber)"
                    
                }else if inputNumber! < minNumber {
                    
                    MessageLabel.text = "too small,guess number between \(minNumber)~\(maxNumber)"
                }else{
                    
                    //messageLabel.text = "check ans"
                    if inputNumber == answer {
                        MessageLabel.text = "You are right, press Guest to play again"
                        isOver = true
                    }else {
                        if inputNumber! > answer {
                            maxNumber = inputNumber!
                        }else {
                            minNumber = inputNumber!
                        }
                        MessageLabel.text = "Try Again! guess number between \(minNumber)~\(maxNumber) "
                    }
                }
            }
        }else{
            //reset value
            minNumber = 1
            maxNumber = 100
            isOver = false
            MessageLabel.text = "guess number between \(minNumber)~\(maxNumber) "
            answer = Int(arc4random_uniform( 100 ) + 1 )
            Inputttext.text = ""
        }//end of have isOver is true
        
        
        
    }/////ene of button
    
    @IBAction func GuessButton(_ sender: UIButton) {
     
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // Inputtext.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
