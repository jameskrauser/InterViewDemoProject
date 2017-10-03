//
//  WebViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/2.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myurl = URL(string: "https://www.asustor.com/")
        
        WebView.loadRequest(URLRequest(url: myurl!))
        
        
        
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
