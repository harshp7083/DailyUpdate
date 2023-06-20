//
//  SignUpViewController.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 20/06/23.
//

import UIKit
import Lottie

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var animationView: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 12
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.8
        animationView.loopMode = .playOnce
        animationView.play()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
