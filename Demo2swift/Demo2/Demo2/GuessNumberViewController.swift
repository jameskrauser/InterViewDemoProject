//
//  GuessNumberViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/1.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit

class GuessNumberViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var Inputtext: UITextField!
    
    
    var answer = Int(arc4random_uniform( 100 ) + 1 )
    var minNumber:Int = 1
    var maxNumber:Int = 100
    var isOver = false
////////////////////
    @IBAction func GuessAns(_ sender: UIButton) {
        if isOver == false {
            let inputText = Inputtext.text!
            let inputNumber = Int(inputText)
            print("ans is \(answer)")
            
            Inputtext.text = ""
            if inputNumber == nil {
                messageLabel.text = "no input! guess number between \(minNumber)~\(maxNumber)"
            }else {
                if inputNumber! > maxNumber {
                    
                    messageLabel.text = "too large,guess number between \(minNumber)~\(maxNumber)"
                    
                }else if inputNumber! < minNumber {
                    
                    messageLabel.text = "too small,guess number between \(minNumber)~\(maxNumber)"
                }else{
                    
                    //messageLabel.text = "check ans"
                    if inputNumber == answer {
                        messageLabel.text = "You are right, press Guest to play again"
                        isOver = true
                    }else {
                        if inputNumber! > answer {
                            maxNumber = inputNumber!
                        }else {
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "Try Again! guess number between \(minNumber)~\(maxNumber) "
                    }
                }
            }
        }else{
            //reset value
            minNumber = 1
            maxNumber = 100
            isOver = false
            messageLabel.text = "guess number between \(minNumber)~\(maxNumber) "
            answer = Int(arc4random_uniform( 100 ) + 1 )
            Inputtext.text = ""
        }//end of have isOver is true
  ///////////////////////////////////
        
        
        
        
        
    }// end of button
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
