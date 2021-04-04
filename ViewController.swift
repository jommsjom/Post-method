//
//  ViewController.swift
//  Postapi4
//
//  Created by iROID Technologies on 25/10/19.
//  Copyright © 2019 iROID Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pass_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var name_txt: UITextField!
    
    
    @IBOutlet weak var phono_txt: UITextField!
    var getdata = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btn_login(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewViewController") as? NewViewController
       
        let url = URL(string:"http://iroidtechnologies.in/Johns_hub/Johns_Api/signup")
        var req = URLRequest(url:url!)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        req.httpMethod = "post"
        let poststring = "name=\(name_txt.text!)&email=\(email_txt.text!)&mobile=\(String(describing: phono_txt.text))&password=\(pass_txt.text!)"
        print("posstring__>",poststring)
        
        let task = URLSession.shared.dataTask(with: req){(data,response,error) in
            let mydata = data
            
            do{
                print("mydata",mydata!)
                do{
                    self.getdata.append(mydata!)
                    
                    let jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])
                    print("jsondata-->",jsondata)
                }
            }
            catch{
                print("error-->",error.localizedDescription)
                
            }
        }
        task.resume()
        
        self.present(nextViewController!, animated:true, completion:nil)
    };
   
    
    
}









