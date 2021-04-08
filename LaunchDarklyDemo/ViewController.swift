//
//  ViewController.swift
//  LaunchDarklyDemo
//
//  Created by Jacob White on 3/26/21.
//

import UIKit
import LaunchDarkly

fileprivate let featureFlagKey = "new-onboarding-screen"

class ViewController: UIViewController {

    @IBOutlet weak var featureFlagLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        // watch for changes to featureFlagKey update the UI when the change comes in.
        LDClient.get()?.observe(key: featureFlagKey, owner: self) { [weak self] changedFlag in
            self?.updateLabel()
        }
    }
    
    fileprivate func updateLabel() {
        //Get the value of the feature flag, and update the UI
        let featureFlagValue = LDClient.get()!.variation(forKey: featureFlagKey, defaultValue: false)
        featureFlagLabel.text = "\(featureFlagKey): \(featureFlagValue)"
    }

}
