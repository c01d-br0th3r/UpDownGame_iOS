//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이찬형 on 2020/12/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderValueLabel: UILabel!
    @IBOutlet var tryCountLabel: UILabel!
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    var randomNumber: Int = 0
    var tryCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slider.value = 15
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    func reset() {
        randomNumber = Int.random(in: 0...30)
        print(randomNumber)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomNumber == hitValue {
            print("You HIT!!")
            showAlert("YOU WIN!!")
        } else if tryCount >= 5 {
            print("You Lose...")
            showAlert("YOU LOSE..")
        } else if randomNumber > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else if randomNumber < hitValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        reset()
    }
}

