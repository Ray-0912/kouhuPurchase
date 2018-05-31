//
//  login.swift
//  kouhuPurchase
//
//  Created by 楊昇融 on 2018/3/28.
//  Copyright © 2018年 alltop. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import FacebookLogin
import FacebookCore

class login : UIViewController{
    
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        self.login(txtAccount.text!, txtPassword.text!)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "signUp", sender: nil)
    }
    
    @IBAction func closePopup(segue: UIStoryboardSegue) {
    }
    @IBAction func facebookLogin(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile,.email,.userFriends], viewController: self) { (loginResult) in
            switch loginResult{
            case .failed(let error):
                print(error)
            //失敗的時候回傳
            case .cancelled:
                print("the user cancels login")
            //取消時回傳內容
            case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                self.getDetails()
                print("user log in")
                //成功時print("user log in")
            }
        }
    }
    
    func login(_ account:String, _ password:String) {
        let loginURL = "\(globalVar.URL)"
        Alamofire.request(loginURL).responseJSON { response in
            if response.result.isSuccess {
                self.performSegue(withIdentifier: "backMain", sender: nil)
            }
        }
    }
    
    
    func getDetails(){
        guard let _ = AccessToken.current else{return}
        let param = ["fields":"name, email , gender,age_range"]
        let graphRequest = GraphRequest(graphPath: "me",parameters: param)
        graphRequest.start { (urlResponse, requestResult) in
            switch requestResult{
            case .failed(let error):
                print(error)
            case .success(response: let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue{
                    print(responseDictionary)
                }
            }
        }
    }
}
