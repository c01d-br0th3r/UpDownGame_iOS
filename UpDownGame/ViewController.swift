//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이찬형 on 2020/12/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slider.value = 15
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
    }
}

