//
//  createGame.swift
//  诵诗
//
//  Created by yuannnn on 2017/11/12.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import Alamofire

class createGameController: UIViewController {
    
    @IBOutlet weak var id: UIButton!
    var timer:Timer!
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://101.132.142.238/test/HelloWorld?order=1&name=player1", method: .get).responseString { response in
            print("Success: \(response.result.isSuccess)")
            let str = response.result.value!
            let dict = self.convertToDictionary(text: str)
            print(dict)
            self.id.setTitle(dict?["id"] as! String, for: .normal)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1,target:self,selector:#selector(createGameController.checkState),userInfo:nil,repeats:true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkState(){
        Alamofire.request("http://101.132.142.238/test/HelloWorld?order=100&name=bixiao", method: .get).responseString { response in
            let str = response.result.value!
            var dict = self.convertToDictionary(text: str)
            
            
            if String(describing: dict!["state"]!) != "waiting"{
                    let gameView = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "gameview")
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "players")
//                    self.navigationController?.pushViewController(gameView, animated: true)
                    self.present(gameView, animated: true, completion:nil)
//                    defaults.integer(forKey: "players")
                }
            }
    }
    
    
    
}

