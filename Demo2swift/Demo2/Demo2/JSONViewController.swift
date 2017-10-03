//
//  JSONViewController.swift
//  Demo2
//
//  Created by jameskrauser on 2017/9/30.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

import UIKit
import AudioToolbox

//data
struct JsonUser {
    var name:String?
    var email:String?
    var phoneNumber:String?
    var image:String?
}

class JSONViewController: UIViewController  {

    var isDownloading = false
    @IBAction func Refresh(_ sender: UIButton) {
        if isDownloading == false {
            downloadWithURLSession(webAddress: apiaddress)
        }
    }
    
    @IBOutlet weak var JsonImage: UIImageView!
    @IBOutlet weak var JsonName: UILabel!
    //for Json Data
    var JsonInfoTableViewController:JSONTableViewController?
    let apiaddress = "https://randomuser.me/api/"
    let reachability  = Reachability(hostName: "www.apple.com")
    var session  =  URLSession(configuration: .default )
    
    
    
    
    func downloadWithURLSession( webAddress:String) {
        if let url = URL(string: webAddress) { //convert webaddress to url formate
            if check_internetOK() == true {
              let task = session.dataTask(with: url , completionHandler: {
                    (data, response , error ) in
                if error != nil {
                    DispatchQueue.main.async { //非同步佇例
                        self.popAlert(withTitle: "Sorry", andMessage: error!.localizedDescription )
                    }
                    self.isDownloading = false
                    return
                }
                if let downloadedData = data{
                    do{
                        //get json_data from url
                        let result_json =  try  JSONSerialization.jsonObject(with: downloadedData, options: [] )
                        DispatchQueue.main.async {
                            self.parseJson(json: result_json )
                        }
                    }catch{
                        DispatchQueue.main.async { //非同步佇例
                            self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription )
                        }
                    }
                }else {
                    self.isDownloading = false
                }
              })
              task.resume()
              isDownloading = true
            }else {
                popAlert(withTitle: "No Internet", andMessage: "Please try again later")
            }
        }else {
            popAlert(withTitle: "Sorry", andMessage: "Can't generate json from random.me web")
        }
    }
    
    func parseJson(json:Any ) {
        if let okjson = json as? [String:Any] {
            if let infoArray = okjson["results"] as? [[String:Any]] {//用result這個key,取值
                let infoDictionary = infoArray[0]
                // print(infoDictionary["name"])
                //exampel at https://randomuser.me
                let loadedName = userFullName(nameDictionary: infoDictionary["name"])
                let loadedEmail = infoDictionary["email"] as? String
                let loadedPhone = infoDictionary["phone"] as? String
                let imageDictionary =  infoDictionary["picture"] as? [String:String]
                let loadedImageAddress = imageDictionary?["large"]
                let loadedUser = JsonUser(name: loadedName, email: loadedEmail, phoneNumber: loadedPhone, image: loadedImageAddress)
                
                settingInfo(user: loadedUser)//set data to label
            }else {
                isDownloading = false
            }
        }else {
            isDownloading = false
        }
    }
    
    func userFullName(nameDictionary:Any? ) -> String? {
        if let okDictionary = nameDictionary as? [String:String] {
           let firstName = okDictionary["first"] ?? ""
           let lastName = okDictionary["last"] ?? ""
           return firstName + " " + lastName
        }else {
            return nil
        }
    }
    
    
    func downloadWithData(webAddress:String ) {
        if let url = URL(string: webAddress) {//convert webaddress to url formate
            if check_internetOK() == true {
                DispatchQueue.global().async { //prevent GUL lcok //共時佇例
                    do{
                        let downloadedData = try Data(contentsOf: url )//get json_data from url
                        print (try  JSONSerialization.jsonObject(with: downloadedData, options: [] ) )
                    }catch{
                        DispatchQueue.main.async { //非同步佇例
                            self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription )
                        }
                    }
                }
            }else {
                popAlert(withTitle: "No Internet", andMessage: "Please try again later")
            }
        }else {
            popAlert(withTitle: "Sorry", andMessage: "Can't generate json from random.me web")
        }
    }
    
    func popAlert(withTitle title:String , andMessage message:String ) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
       alert.addAction( UIAlertAction(title: "ok", style: .default, handler: nil )  )
       present(alert, animated: true, completion: nil )
    }
    
    
    func check_internetOK() -> Bool {
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            return false //no internet
        }else {
            return true // have internet
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* test data
        let jUser = JsonUser( name:"james" ,
                              email:"lijunmin@gmail.com" ,
                              phoneNumber:"0963022376" ,
                              image:"http:/picture.me")
        
        settingInfo(user:jUser)//setup test info
        */
        //downloadWithData(webAddress: apiaddress) //connect method1
        downloadWithURLSession(webAddress: apiaddress)//connect method2

    }
    func settingInfo( user:JsonUser ) {
          AudioServicesPlayAlertSound(1000)
          JsonName.text = user.name
          JsonInfoTableViewController?.phoneLabel.text  = user.phoneNumber
          JsonInfoTableViewController?.emailLabel.text = user.email
        if let imageAddress = user.image {
            if let imageURL = URL(string: imageAddress) {
               let task = session.downloadTask(with: imageURL, completionHandler: {
                    (url ,  response , error ) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.popAlert(withTitle: "Sorry", andMessage: error!.localizedDescription)
                    }
                    self.isDownloading = false
                    return
                }
                if let okURL = url {
                    do{
                        
                        let downloadImage = UIImage(data:  try Data(contentsOf: okURL )    )
                        DispatchQueue.main.async {
                            self.JsonImage.image = downloadImage
                            self.isDownloading = false
                        }
                    }catch{
                        DispatchQueue.main.async {
                            self.popAlert(withTitle: "Sorry", andMessage: error.localizedDescription )
                            self.isDownloading = false
                        }
                    }
                }
                
               })
               task.resume()
            }else {
                isDownloading = false
            }
        }else {
            isDownloading = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        JsonImage.layer.cornerRadius = JsonImage.frame.size.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreinfo" {
              JsonInfoTableViewController = segue.destination as?JSONTableViewController
        }
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
