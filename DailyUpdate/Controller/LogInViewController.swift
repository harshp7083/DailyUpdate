//
//  ViewController.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 12/06/23.
//

import UIKit
import Lottie


class LogInViewController: UIViewController {

    
    
    @IBOutlet weak var animationView: LottieAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationView.layer.cornerRadius = 12
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.8
        animationView.loopMode = .playOnce
        animationView.play()
    }


}

