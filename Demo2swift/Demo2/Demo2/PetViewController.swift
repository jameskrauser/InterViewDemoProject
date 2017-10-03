//
//  PetViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/10/1.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//  for cat

import UIKit

class PetViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    
    let catyears = [ 15 , 24 , 28 , 32 , 36 , 40 , 44 , 48 , 52 , 56 , 60 , 64 , 68 , 72, 76 , 80, 88 , 92 , 86 ]
    
    @IBOutlet weak var yearPicker: UIPickerView!
    
    @IBAction func GiveMeAns(_ sender: UIButton) {
       let age = yearPicker.selectedRow(inComponent: 0)
       var resultAge:Int
       resultAge = catyears[age]
        
       let resultAlert = UIAlertController(title: "result", message: "pet's age is \(resultAge)", preferredStyle: .alert )
       
        let okButton = UIAlertAction(title: "ok", style: .default , handler: {
             (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil )
        })
    
        resultAlert.addAction(okButton)
        
        present(resultAlert, animated: true , completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let yearNumber = row + 1
        if yearNumber == 1 {
            return "\(yearNumber) year old."
        }else{
            return "\(yearNumber) years old."
        }
        
        
        
    }
    
    
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


