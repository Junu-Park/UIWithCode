//
//  ViewController.swift
//  UIWithCode
//
//  Created by 박준우 on 1/13/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func transitionView(_ sender: UIButton) {
        var vc: UIViewController = UIViewController()
        
        switch sender.titleLabel?.text {
        case "Netflix":
            vc = NetflixViewController()
        case "Npay":
            vc = NpayViewController()
        case "MovieRanking":
            vc = MovieRankingViewController()
        default:
            break
        }
        present(vc, animated: true)
    }
}
