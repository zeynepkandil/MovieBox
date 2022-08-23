//
//  SplashVC.swift
//  MovieBox-MVC
//
//  Created by Kafein on 17.08.2022.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var splashLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let _ = app.defaults.getAccessToken() {
                app.router.goToTabbar()
            } else {
                app.router.goToLoginVC()
            }
        }
    }
    

}
