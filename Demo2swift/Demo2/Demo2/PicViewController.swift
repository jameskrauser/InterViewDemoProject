//
//  PicViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/1.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit

class PicViewController: UIViewController {
   var index_pic:Int! = 0
    
   let images = [ "0.png" , "1.JPG" , "2.JPG" ,  "3.JPG" , "4.JPG" , "5.JPG" , "6.JPG" , "7.JPG"  ]
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index_pic = 0
        myImage.contentMode = UIViewContentMode.scaleAspectFit
        // Do any additional setup after loading the view.
    }

    
    @IBAction func NextPic(_ sender: UIButton) {
       
        if index_pic == images.count - 1 {
            index_pic = 0
        } else {
            index_pic = index_pic +   1
        }
        myImage.image = UIImage(named: images[index_pic!])
    }
    
    
    @IBAction func PrePic(_ sender: UIButton) {
        if index_pic == 0 {
            index_pic = images.count - 1
        } else {
            index_pic = index_pic - 1
        }
        myImage.image = UIImage(named: images[index_pic!]  )
        
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
