import UIKit

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
    @IBOutlet weak var garageImage: UIImageView!
    
    private let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        let viewHeight = view.frame.size.height
        let viewWidth = view.frame.size.width
        
        backButton.frame = CGRect(x: viewWidth * 0.03, y: viewHeight * 0.05, width: viewWidth * 0.266, height: viewHeight * 0.056)
        saveOptionsButton.frame = CGRect(x: 0, y: viewHeight * 0.725, width: viewWidth, height: viewHeight * 0.056)
        
        leftButtonChoiceCarBrand.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.167, width: viewWidth * 0.056, height: viewHeight * 0.056)
        rightButtonChoiceCarBrand.frame = CGRect(x: viewWidth * 0.833, y: viewHeight * 0.167, width: viewWidth * 0.056, height: viewHeight * 0.056)
        
        leftButtonNeonLightChoice.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.5, width: viewWidth * 0.056, height: viewHeight * 0.056)
        rightButtonNeonLightChoice.frame = CGRect(x: viewWidth * 0.833, y: viewHeight * 0.5, width: viewWidth * 0.056, height: viewHeight * 0.056)
        
        leftButtonSpeedCarChoice.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.658, width: viewWidth * 0.056, height: viewHeight * 0.056)
        rightButtonSpeedCarChoice.frame = CGRect(x: viewWidth * 0.833, y: viewHeight * 0.658, width: viewWidth * 0.056, height: viewHeight * 0.056)
        
        carBrandLabel.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.1, width: viewWidth * 0.9, height: viewHeight * 0.044)
        neonLightsLabel.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.44, width: viewWidth * 0.9, height: viewHeight * 0.044)
        speedCarLabel.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.6, width: viewWidth * 0.9, height: viewHeight * 0.044)
        
        carBrandChoiceLabel.frame = CGRect(x: viewWidth * 0.193, y: viewHeight * 0.167, width: viewWidth * 0.628, height: viewHeight * 0.056)
        neonLightsChoiceLabel.frame = CGRect(x: viewWidth * 0.193, y: viewHeight * 0.5, width: viewWidth * 0.628, height: viewHeight * 0.056)
        speedCarChoiceLabel.frame = CGRect(x: viewWidth * 0.193, y: viewHeight * 0.658, width: viewWidth * 0.628, height: viewHeight * 0.056)
        
        carBrandImage.frame = CGRect(x: viewWidth * 0.217, y: viewHeight * 0.234, width: viewWidth * 0.58, height: viewHeight * 0.2)
        garageImage.frame = CGRect(x: 0, y: viewHeight * 0.859, width: viewWidth, height: viewHeight * 0.189)
        
        backButton.setTitle(NSLocalizedString("back_button", comment: ""), for: .normal)
        saveOptionsButton.setTitle(NSLocalizedString("save_button", comment: ""), for: .normal)
        carBrandLabel.text = NSLocalizedString("car_label", comment: "")
        neonLightsLabel.text = NSLocalizedString("neon_lights", comment: "")
        speedCarLabel.text = NSLocalizedString("speed_car", comment: "")
    
        carBrandChoiceLabel.text = locString(string: "nissan")
        carBrandImage.image = UIImage(named: "imageFirstCar")
        neonLightsChoiceLabel.text = locString(string: "orange")
        speedCarChoiceLabel.text = locString(string: "low")
    }
    
    private func defaultOptions() {
        switch carBrandChoiceLabel.text {
        case locString(string: "nissan"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFirstCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case locString(string: "mitsubishi"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageSecondCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case locString(string: "ferrari"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageThirdCar", forKey: UserOptionsKey.carImageKey.rawValue)
        case locString(string: "volvo"):
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFourthCar", forKey: UserOptionsKey.carImageKey.rawValue)
        default:
            userDefaults.set(carBrandChoiceLabel.text, forKey: UserOptionsKey.carKey.rawValue)
            userDefaults.set("imageFifthCar", forKey: UserOptionsKey.carImageKey.rawValue)
        }
        
        switch neonLightsChoiceLabel.text {
        case locString(string: "yellow"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("yellow", forKey: UserOptionsKey.neonKey.rawValue)
        case locString(string: "purple"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("purple", forKey: UserOptionsKey.neonKey.rawValue)
        case locString(string: "green"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("green", forKey: UserOptionsKey.neonKey.rawValue)
        case locString(string: "blue"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("blue", forKey: UserOptionsKey.neonKey.rawValue)
        case locString(string: "red"):
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("red", forKey: UserOptionsKey.neonKey.rawValue)
        default:
            userDefaults.set(neonLightsChoiceLabel.text, forKey: UserOptionsKey.neonLocKey.rawValue)
            userDefaults.set("orange", forKey: UserOptionsKey.neonKey.rawValue)
        }
        
        switch speedCarChoiceLabel.text {
        case locString(string: "low"):
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("low", forKey: UserOptionsKey.speedKey.rawValue)
        case locString(string: "average"):
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("average", forKey: UserOptionsKey.speedKey.rawValue)
        default:
            userDefaults.set(speedCarChoiceLabel.text, forKey: UserOptionsKey.speedLocKey.rawValue)
            userDefaults.set("fast", forKey: UserOptionsKey.speedKey.rawValue)
        }
    }
    
    @IBAction func leftButtonChoiceCarBrandClick(_ sender: Any) {
        switch carBrandChoiceLabel.text {
        case locString(string: "toyota"):
            carBrandChoiceLabel.text = locString(string: "volvo")
            carBrandImage.image = UIImage(named: "imageFourthCar")
        case locString(string: "volvo"):
            carBrandChoiceLabel.text = locString(string: "ferrari")
            carBrandImage.image = UIImage(named: "imageThirdCar")
        case locString(string: "ferrari"):
            carBrandChoiceLabel.text = locString(string: "mitsubishi")
            carBrandImage.image = UIImage(named: "imageSecondCar")
        case locString(string: "mitsubishi"):
            carBrandChoiceLabel.text = locString(string: "nissan")
            carBrandImage.image = UIImage(named: "imageFirstCar")
        default :
            carBrandChoiceLabel.text = locString(string: "toyota")
            carBrandImage.image = UIImage(named: "imageFifthCar")
        }
    }
        
    @IBAction func rightButtonChoiceCarBrandClick(_ sender: Any) {
        switch carBrandChoiceLabel.text {
        case locString(string: "nissan"):
            carBrandChoiceLabel.text = locString(string: "mitsubishi")
            carBrandImage.image = UIImage(named: "imageSecondCar")
        case locString(string: "mitsubishi"):
            carBrandChoiceLabel.text = locString(string: "ferrari")
            carBrandImage.image = UIImage(named: "imageThirdCar")
        case locString(string: "ferrari"):
            carBrandChoiceLabel.text = locString(string: "volvo")
            carBrandImage.image = UIImage(named: "imageFourthCar")
        case locString(string: "volvo"):
            carBrandChoiceLabel.text = locString(string: "toyota")
            carBrandImage.image = UIImage(named: "imageFifthCar")
        default:
            carBrandChoiceLabel.text = locString(string: "nissan")
            carBrandImage.image = UIImage(named: "imageFirstCar")
        }
    }
    
    @IBAction func leftButtonNeonLightChoiceClick(_ sender: Any) {
        switch neonLightsChoiceLabel.text {
        case locString(string: "yellow"):
            neonLightsChoiceLabel.text = locString(string: "purple")
        case locString(string: "purple"):
            neonLightsChoiceLabel.text = locString(string: "green")
        case locString(string: "green"):
            neonLightsChoiceLabel.text = locString(string: "blue")
        case locString(string: "blue"):
            neonLightsChoiceLabel.text = locString(string: "red")
        case locString(string: "red"):
            neonLightsChoiceLabel.text = locString(string: "orange")
        default:
            neonLightsChoiceLabel.text = locString(string: "yellow")
        }
    }
        
    @IBAction func rightButtonNeonLightChoiceClick(_ sender: Any) {
        switch neonLightsChoiceLabel.text {
        case locString(string: "orange"):
            neonLightsChoiceLabel.text = locString(string: "red")
        case locString(string: "red"):
            neonLightsChoiceLabel.text = locString(string: "blue")
        case locString(string: "blue"):
            neonLightsChoiceLabel.text = locString(string: "green")
        case locString(string: "green"):
            neonLightsChoiceLabel.text = locString(string: "purple")
        case locString(string: "purple"):
            neonLightsChoiceLabel.text = locString(string: "yellow")
        default:
            neonLightsChoiceLabel.text = locString(string: "orange")
        }
    }
    
    @IBAction func leftButtonSpeedCarChoiceClick(_ sender: Any) {
        switch speedCarChoiceLabel.text {
        case locString(string: "fast"):
            speedCarChoiceLabel.text = locString(string: "average")
        case locString(string: "average"):
            speedCarChoiceLabel.text = locString(string: "low")
        default:
            speedCarChoiceLabel.text = locString(string: "fast")
        }
    }
    
    @IBAction func rightButtonSpeedCarChoiceClick(_ sender: Any) {
        switch speedCarChoiceLabel.text {
        case locString(string: "low"):
            speedCarChoiceLabel.text = locString(string: "average")
        case locString(string: "average"):
            speedCarChoiceLabel.text = locString(string: "fast")
        default:
            speedCarChoiceLabel.text = locString(string: "low")
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
