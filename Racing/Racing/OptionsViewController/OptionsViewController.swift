import UIKit

//let carLoc = NSLocalizedString("car", comment: "")

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveOptionsButton: UIButton!
    
    @IBOutlet weak var leftButtonChoiceCarBrand: UIButton!
    @IBOutlet weak var rightButtonChoiceCarBrand: UIButton!
    @IBOutlet weak var leftButtonNeonLightChoice: UIButton!
    @IBOutlet weak var rightButtonNeonLightChoice: UIButton!
    @IBOutlet weak var leftButtonSpeedCarChoice: UIButton!
    @IBOutlet weak var rightButtonSpeedCarChoice: UIButton!
    
    @IBOutlet weak var carBrandLabel: UILabel!
    @IBOutlet weak var neonLightsLabel: UILabel!
    @IBOutlet weak var speedCarLabel: UILabel!
    
    @IBOutlet weak var carBrandChoiceLabel: UILabel!
    @IBOutlet weak var neonLightsChoiceLabel: UILabel!
    @IBOutlet weak var speedCarChoiceLabel: UILabel!
    
    @IBOutlet weak var carBrandImage: UIImageView!
    
    private let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        backButton.setTitle(NSLocalizedString("back_button", comment: ""), for: .normal)
        saveOptionsButton.setTitle(NSLocalizedString("save_button", comment: ""), for: .normal)
        
        carBrandLabel.text = NSLocalizedString("car_label", comment: "")
        neonLightsLabel.text = NSLocalizedString("neon_lights", comment: "")
        speedCarLabel.text = NSLocalizedString("speed_car", comment: "")
        
        
        changeFontButton(button: backButton, size: 20)
        changeFontButton(button: saveOptionsButton, size: 40)
        
        changeFontLabel(label: carBrandLabel, size: 20)
        changeFontLabel(label: neonLightsLabel, size: 20)
        changeFontLabel(label: speedCarLabel, size: 20)
        
        changeFontLabel(label: carBrandChoiceLabel, size: 20)
        changeFontLabel(label: neonLightsChoiceLabel, size: 20)
        changeFontLabel(label: speedCarChoiceLabel, size: 20)
        
//        let carBrand = userDefaults.string(forKey: UserOptionsKey.carKey.rawValue)
//        let carImage = userDefaults.string(forKey: UserOptionsKey.carImageKey.rawValue)
//        let neonLight = userDefaults.string(forKey: UserOptionsKey.neonLocKey.rawValue)
//        let speedCar = userDefaults.string(forKey: UserOptionsKey.speedLocKey.rawValue)
        
//        if (userDefaults.string(forKey: UserOptionsKey.carKey.rawValue) == nil) || (userDefaults.string(forKey: UserOptionsKey.neonLocKey.rawValue) == nil) || (userDefaults.string(forKey: UserOptionsKey.speedLocKey.rawValue) == nil) || (userDefaults.string(forKey: UserOptionsKey.carImageKey.rawValue) == nil) {
            carBrandChoiceLabel.text = LocString(string: "nissan")
            carBrandImage.image = UIImage(named: "imageFirstCar")
            neonLightsChoiceLabel.text = LocString(string: "orange")
            speedCarChoiceLabel.text = LocString(string: "low")
//        } else {
//            carBrandChoiceLabel.text = carBrand
//            carBrandImage.image = UIImage(named: carImage!)
//            neonLightsChoiceLabel.text = neonLight
//            speedCarChoiceLabel.text = speedCar
//        }
    }
    
    private func defaultOptions() {
        switch carBrandChoiceLabel.text {
        case LocString(string: "nissan"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFirstCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case LocString(string: "mitsubishi"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageSecondCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case LocString(string: "ferrari"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageThirdCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case LocString(string: "volvo"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFourthCar", forKey: UserOptionsKey.carImageKey.rawValue)
        default:
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFifthCar", forKey: UserOptionsKey.carImageKey.rawValue)
        }
        
        switch neonLightsChoiceLabel.text {
        case LocString(string: "yellow"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("yellow", forKey: UserOptionsKey.neonKey.rawValue)
        case LocString(string: "purple"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("purple", forKey: UserOptionsKey.neonKey.rawValue)
        case LocString(string: "green"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("green", forKey: UserOptionsKey.neonKey.rawValue)
        case LocString(string: "blue"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("blue", forKey: UserOptionsKey.neonKey.rawValue)
        case LocString(string: "red"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("red", forKey: UserOptionsKey.neonKey.rawValue)
        default:
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("orange", forKey: UserOptionsKey.neonKey.rawValue)
        }
        
        switch speedCarChoiceLabel.text {
        case LocString(string: "low"):
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("low", forKey: UserOptionsKey.speedKey.rawValue)
        case LocString(string: "average"):
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("average", forKey: UserOptionsKey.speedKey.rawValue)
        default:
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("fast", forKey: UserOptionsKey.speedKey.rawValue)
        }
    }
    
    @IBAction func leftButtonChoiceCarBrandClick(_ sender: Any) {
        switch carBrandChoiceLabel.text {
        case LocString(string: "toyota"):
            carBrandChoiceLabel.text = LocString(string: "volvo")
            carBrandImage.image = UIImage(named: "imageFourthCar")
        case LocString(string: "volvo"):
            carBrandChoiceLabel.text = LocString(string: "ferrari")
            carBrandImage.image = UIImage(named: "imageThirdCar")
        case LocString(string: "ferrari"):
            carBrandChoiceLabel.text = LocString(string: "mitsubishi")
            carBrandImage.image = UIImage(named: "imageSecondCar")
        case LocString(string: "mitsubishi"):
            carBrandChoiceLabel.text = LocString(string: "nissan")
            carBrandImage.image = UIImage(named: "imageFirstCar")
        default :
            carBrandChoiceLabel.text = LocString(string: "toyota")
            carBrandImage.image = UIImage(named: "imageFifthCar")
        }
    }
        
    @IBAction func rightButtonChoiceCarBrandClick(_ sender: Any) {
        switch carBrandChoiceLabel.text {
        case LocString(string: "nissan"):
            carBrandChoiceLabel.text = LocString(string: "mitsubishi")
            carBrandImage.image = UIImage(named: "imageSecondCar")
        case LocString(string: "mitsubishi"):
            carBrandChoiceLabel.text = LocString(string: "ferrari")
            carBrandImage.image = UIImage(named: "imageThirdCar")
        case LocString(string: "ferrari"):
            carBrandChoiceLabel.text = LocString(string: "volvo")
            carBrandImage.image = UIImage(named: "imageFourthCar")
        case LocString(string: "volvo"):
            carBrandChoiceLabel.text = LocString(string: "toyota")
            carBrandImage.image = UIImage(named: "imageFifthCar")
        default:
            carBrandChoiceLabel.text = LocString(string: "nissan")
            carBrandImage.image = UIImage(named: "imageFirstCar")
        }
    }
    
    @IBAction func leftButtonNeonLightChoiceClick(_ sender: Any) {
        switch neonLightsChoiceLabel.text {
        case LocString(string: "yellow"):
            neonLightsChoiceLabel.text = LocString(string: "purple")
        case LocString(string: "purple"):
            neonLightsChoiceLabel.text = LocString(string: "green")
        case LocString(string: "green"):
            neonLightsChoiceLabel.text = LocString(string: "blue")
        case LocString(string: "blue"):
            neonLightsChoiceLabel.text = LocString(string: "red")
        case LocString(string: "red"):
            neonLightsChoiceLabel.text = LocString(string: "orange")
        default:
            neonLightsChoiceLabel.text = LocString(string: "yellow")
        }
    }
        
    @IBAction func rightButtonNeonLightChoiceClick(_ sender: Any) {
        switch neonLightsChoiceLabel.text {
        case LocString(string: "orange"):
            neonLightsChoiceLabel.text = LocString(string: "red")
        case LocString(string: "red"):
            neonLightsChoiceLabel.text = LocString(string: "blue")
        case LocString(string: "blue"):
            neonLightsChoiceLabel.text = LocString(string: "green")
        case LocString(string: "green"):
            neonLightsChoiceLabel.text = LocString(string: "purple")
        case LocString(string: "purple"):
            neonLightsChoiceLabel.text = LocString(string: "yellow")
        default:
            neonLightsChoiceLabel.text = LocString(string: "orange")
        }
    }
    
    @IBAction func leftButtonSpeedCarChoiceClick(_ sender: Any) {
        switch speedCarChoiceLabel.text {
        case LocString(string: "fast"):
            speedCarChoiceLabel.text = LocString(string: "average")
        case LocString(string: "average"):
            speedCarChoiceLabel.text = LocString(string: "low")
        default:
            speedCarChoiceLabel.text = LocString(string: "fast")
        }
    }
    
    @IBAction func rightButtonSpeedCarChoiceClick(_ sender: Any) {
        switch speedCarChoiceLabel.text {
        case LocString(string: "low"):
            speedCarChoiceLabel.text = LocString(string: "average")
        case LocString(string: "average"):
            speedCarChoiceLabel.text = LocString(string: "fast")
        default:
            speedCarChoiceLabel.text = LocString(string: "low")
        }
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveOptionsButtonClick(_ sender: Any) {
        defaultOptions()
        dismiss(animated: true, completion: nil)
    }
}
