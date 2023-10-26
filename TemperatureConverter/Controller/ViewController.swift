//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by kraujalis.rolandas on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderValueChange(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func tempSelectionChange(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)

    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        guard let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "info") as? InfoViewController else { return }
        infoVC.tempLabel = "\(celsiusLabel.text ?? "") is equal to \(convertedTempLabel.text ?? "")"
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    func updateTempLabelFromSlider(value: Float) {
        print(Int(value))
        #warning("chech which segment controller is on and make a temp calculation based on F, K")
        celsiusLabel.text = "\(Int(value)) ºC"
        let temp = convertTempFrom(celsius: Int(value))
        if tempSegmentControl.selectedSegmentIndex == 0 {
            convertedTempLabel.text = "\(temp.0) ºF"
        } else {
            convertedTempLabel.text = "\(temp.1) K"
        }
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = Double(celsius) * 9 / 5 + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    #warning("pass result to InfoVC without segue")
    
}

