//
//  ViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/9/30.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func GoToIntroduce(_ sender: UIButton) {
        performSegue(withIdentifier: "ToIntroduce", sender: nil )
    }
    
    
    @IBAction func GoToGuess(_ sender: UIButton) {
        performSegue(withIdentifier: "ToGuess", sender: nil )
    }
    
    @IBAction func GoToShowPic(_ sender: UIButton) {
        performSegue(withIdentifier: "ToShowPic", sender: nil )
    }
    
    @IBAction func GoToAppRecorder(_ sender: UIButton) {
        performSegue(withIdentifier: "ToAppRecorder", sender: nil )
    }
    
    @IBAction func GoToTabBar(_ sender: UIButton) {
        performSegue(withIdentifier: "ToTabBar", sender: nil )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

