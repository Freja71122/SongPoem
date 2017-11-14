//
//  joinGame.swift
//  诵诗
//
//  Created by yuannnn on 2017/11/12.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import Alamofire

class joinGameController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    
    @IBAction func join(_ sender: UIButton) {
        let _id = id.text;
        if _id==""{
            let alert = UIAlertController.init(title: "提示", message: "房间号不能为空", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction.init(title: "重新输入", style: .cancel, handler: nil))
            self.present(alert, animated: true) {
                
            }
            return
        }
        else if Int(_id!)!<=0 {
            let alert = UIAlertController.init(title: "提示", message: "房间号需为正数", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction.init(title: "重新输入", style: .cancel, handler: nil))
            self.present(alert, animated: true) {
                
            }
            return
        }
        Alamofire.request("http://101.132.142.238/test/HelloWorld?order=100&name=bixiao", method: .get).responseString { response in
            print("Success: \(response.result.isSuccess)")
            let str = response.result.value!
            var dict = self.convertToDictionary(text: str)
            
            if String(describing: dict!["id"]!) != _id {
                let alert = UIAlertController.init(title: "提示", message: "房间不存在", preferredStyle: .alert)
                alert.addAction(UIAlertAction.init(title: "重新输入", style: .cancel, handler: nil))
                self.present(alert, animated: true) {
                    
                }
                return
            }
            else{
                Alamofire.request("http://101.132.142.238/test/HelloWorld?order=2&name=player2", method: .get)//order=2 状态变为玩家2答题
                let gameView = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "gameview")
                let defaults = UserDefaults.standard
                defaults.set(2, forKey: "players")
//                self.navigationController?.pushViewController(gameView, animated: true)
                self.present(gameView, animated: true, completion:nil)
                //                    defaults.integer(forKey: "players")
            }
        }
    }
    
}

