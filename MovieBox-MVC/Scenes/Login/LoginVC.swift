//
//  LoginVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loginButton.setTitle(Localization.string(key: "login", defaultValue: "Giriş"), for: .normal) 
    }
    
    @IBAction func login(_ sender: UIButton) {
        app.hud.show(in: self.view, animated: true)
        app.networkManager.createRequestToken { result in
            app.hud.dismiss(animated: true)
            
            switch result {
            case .success(let response):
                
                if let _ = response.success {
                    let alert = UIAlertController(title: "BİLGİ", message: "Başarıyla oturum sağlandı.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                        app.defaults.setAccessToken(accessToken: response.requestToken)
                        app.router.goToTabbar()
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("hataa")
                }
                
    
                
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
