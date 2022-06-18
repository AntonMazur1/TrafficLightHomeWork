//
//  ViewController.swift
//  trafficLight
//
//  Created by Клоун on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    private var currentTrafficLight = TrafficLights.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        button.configuration = setupUpButton(with: "START")
    }
    
    @IBAction func changeColor() {
        button.configuration = setupUpButton(with: "NEXT")
        
        switch currentTrafficLight {
        case .red:
            views[2].alpha = 0.3
            views[0].alpha = 1
            currentTrafficLight = .yellow
        case .yellow:
            views[0].alpha = 0.3
            views[1].alpha = 1
            currentTrafficLight = .green
        case .green:
            views[1].alpha = 0.3
            views[2].alpha = 1
            currentTrafficLight = .red
        }
    }
    
    private func setupUpButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        return buttonConfiguration
    }
    
    private func setupViews() {
        for view in views {
            view.layer.cornerRadius = view.frame.height / 2
            view.alpha = 0.3
        }
    }
}


//MARK: Extension For Traffic Lights
extension ViewController {
    enum TrafficLights {
        case red, yellow, green
    }
}
