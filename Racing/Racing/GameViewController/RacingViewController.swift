import UIKit

class RacingViewController: UIViewController {

    @IBOutlet weak var firstRoadImage: UIImageView!
    @IBOutlet weak var secondRoadImage: UIImageView!
    @IBOutlet weak var myCarImage: UIImageView!
    @IBOutlet weak var leftBushImage: UIImageView!
    @IBOutlet weak var rightBushImage: UIImageView!
    @IBOutlet weak var leftStoneImage: UIImageView!
    @IBOutlet weak var rightStoneImage: UIImageView!
    @IBOutlet weak var endGameImage: UIImageView!
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var mySpeedLabel: UILabel!
    
    private var leftSwipeCrash = false
    private var rightSwipeCrash = false
    private var gameOverTimer: Timer?
    private var myScore = 0
    private var recordCounter = 0
    private var carSpeed = 80
    private var durationSpeed = 0.2
    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.frame.size.height
        let viewWidth = view.frame.size.width
        
        leftBushImage.frame = CGRect(x: 0, y: -viewHeight * 0.262, width: viewWidth * 0.169, height: viewHeight * 0.262)
        rightBushImage.frame = CGRect(x: viewWidth * 0.84, y: -viewHeight * 0.262, width: viewWidth * 0.169, height: viewHeight * 0.262)
        
        leftStoneImage.frame = CGRect(x: viewWidth * 0.096, y: -viewHeight * 0.314, width: viewWidth * 0.289, height: viewHeight * 0.094)
        rightStoneImage.frame = CGRect(x: viewWidth * 0.615, y: -viewHeight * 0.314, width: viewWidth * 0.289, height: viewHeight * 0.094)
        
        myCarImage.frame = CGRect(x: viewWidth * 0.096, y: viewHeight * 0.686, width: viewWidth * 0.302, height: viewHeight * 0.189)
        myCarImage.clipsToBounds = false
        myCarImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        firstRoadImage.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        secondRoadImage.frame = CGRect(x: 0, y: -firstRoadImage.frame.size.height, width: viewWidth, height: viewHeight)
        
        myScoreLabel.frame = CGRect(x: viewWidth * 0.507, y: viewHeight * 0.045, width: viewWidth * 0.446, height: viewHeight * 0.03)
        mySpeedLabel.frame = CGRect(x: viewWidth * 0.06, y: viewHeight * 0.045, width: viewWidth * 0.446, height: viewHeight * 0.03)
        
        if UserDefaults.standard.string(forKey: UserOptionsKey.carImageKey.rawValue) == nil {
            myCarImage.image = UIImage(named: "imageFirstCar")
            myCarImage.applyShadow(color: .orange)
        } else {
            if let car = UserDefaults.standard.string(forKey: UserOptionsKey.carImageKey.rawValue) {
                myCarImage.image = UIImage(named: car)
            }
        }
        
        switch UserDefaults.standard.string(forKey: UserOptionsKey.neonKey.rawValue) {
        case "yellow":
            myCarImage.applyShadow(color: .yellow)
        case "red":
            myCarImage.applyShadow(color: .red)
        case "blue":
            myCarImage.applyShadow(color: .blue)
        case "purple":
            myCarImage.applyShadow(color: .purple)
        case "green" :
            myCarImage.applyShadow(color: .green)
        default:
            myCarImage.applyShadow(color: .orange)
        }
        
        switch UserDefaults.standard.string(forKey: UserOptionsKey.speedKey.rawValue) {
        case "low":
            carSpeed = 60
            durationSpeed = 3
            recordCounter = 1
            mySpeedLabel.text = NSLocalizedString("speed_car", comment: "") + ": " + String(carSpeed) + " km/h"
        case "average":
            carSpeed = 80
            durationSpeed = 2.25
            recordCounter = 2
            mySpeedLabel.text = NSLocalizedString("speed_car", comment: "") + ": " + String(carSpeed) + " km/h"
        default:
            carSpeed = 120
            durationSpeed = 1.5
            recordCounter = 3
            mySpeedLabel.text = NSLocalizedString("speed_car", comment: "") + ": " + String(carSpeed) + " km/h"
        }
    }
//MARK: ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
           
        UIView.animate(withDuration: 2, delay: 1, options: [.repeat, .curveLinear], animations: {
            self.firstRoadImage.frame.origin.y = self.view.bounds.height
                  }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 1, options: [.repeat, .curveLinear], animations: {
            self.secondRoadImage.frame.origin.y = 0
                  }, completion: nil)
        
        UIView.animate(withDuration: durationSpeed, delay: TimeInterval(Int.random(in: 1..<9)), options: [.curveLinear, .repeat], animations: {
            self.leftBushImage.center = CGPoint(x: self.leftBushImage.center.x , y: self.leftBushImage.center.y + (self.view.frame.size.height * 1.34))
           }, completion: nil)
        
        UIView.animate(withDuration: durationSpeed, delay: TimeInterval(Int.random(in: 1..<9)), options: [.curveLinear, .repeat], animations: {
               self.rightBushImage.center = CGPoint(x: self.rightBushImage.center.x , y: self.rightBushImage.center.y + (self.view.frame.size.height * 1.34))
           }, completion: nil)
        
        UIView.animate(withDuration: durationSpeed, delay: 2, options: [.curveLinear, .repeat], animations: {
            self.leftStoneImage.center = CGPoint(x: self.leftStoneImage.center.x, y: self.leftStoneImage.center.y + (self.view.frame.size.height * 1.34))
        }, completion: nil)
        
        UIView.animate(withDuration: durationSpeed, delay: 3, options: [.curveLinear, .repeat], animations: {
            self.rightStoneImage.center = CGPoint(x: self.rightStoneImage.center.x, y: self.rightStoneImage.center.y + (self.view.frame.size.height * 1.34))
        }, completion: nil)
//MARK: Timer
        gameOverTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (_) in
            if self.leftStoneImage.layer.presentation()?.frame.intersects(self.myCarImage.frame) == true || self.rightStoneImage.layer.presentation()?.frame.intersects(self.myCarImage.frame) == true {
                
                crashAudioPlayer?.play()
                
                self.saveMyScore()
                self.addAlertAndReturn()
                self.gameOverTimer?.invalidate()
                
                self.endGameImage.image = UIImage(named: "imageExplosion")
                
                self.myCarImage.isHidden = true
                self.firstRoadImage.layer.removeAllAnimations()
                self.secondRoadImage.layer.removeAllAnimations()
                self.leftStoneImage.layer.removeAllAnimations()
                self.rightStoneImage.layer.removeAllAnimations()
                self.leftBushImage.layer.removeAllAnimations()
                self.rightBushImage.layer.removeAllAnimations()
                
            } else {
                self.myScore += self.recordCounter
                self.myScoreLabel.text = NSLocalizedString("score", comment: "") + ": " + String(self.myScore)
            }
        }
        self.gameOverTimer?.fire()
    }
//MARK: SaveScore
    private func saveMyScore() {
        
        let score = Score(userScore: myScore, dateScore: Date())
        let encoder = JSONEncoder()
        let scoreData = try? encoder.encode(score)
        let documetsURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let scoreDataPath = documetsURL!.path + "/Score.json"
        FileManager.default.createFile(atPath: scoreDataPath, contents: scoreData, attributes: nil)
        let saveData = FileManager.default.contents(atPath: scoreDataPath)
        print(scoreDataPath)
        
        let decoder = JSONDecoder()
        let userLastScore = try? decoder.decode(Score.self, from: saveData!)
        if UserDefaults.standard.integer(forKey: UserOptionsKey.scoreKey.rawValue) < userLastScore!.userScore {
            UserDefaults.standard.set(userLastScore?.userScore, forKey: UserOptionsKey.scoreKey.rawValue)
            UserDefaults.standard.set(userLastScore?.dateScore, forKey: UserOptionsKey.dateKey.rawValue)
            }
    }
//MARK: SwapRecognizer
    @IBAction func moveLeftSwipe(_ sender: Any) {
        
        if leftSwipeCrash == true {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveLinear], animations: {
                self.myCarImage.center.x = self.view.frame.minX
                self.myCarImage.transform = self.myCarImage.transform.rotated(by: -CGFloat.pi / 1.4)
            }, completion: nil)
            self.addAlertAndReturn()
            self.saveMyScore()
            self.gameOverTimer?.invalidate()
            
            crashAudioPlayer?.play()
            
            self.endGameImage.image = UIImage(named: "imageExplosion")
        
            self.firstRoadImage.layer.removeAllAnimations()
            self.secondRoadImage.layer.removeAllAnimations()
            self.leftStoneImage.layer.removeAllAnimations()
            self.rightStoneImage.layer.removeAllAnimations()
            self.leftBushImage.layer.removeAllAnimations()
            self.rightBushImage.layer.removeAllAnimations()
            
        } else if myCarImage.center.x - myCarImage.frame.width / 2 > self.view.frame.minX + 70 {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
                self.myCarImage.center.x = self.view.frame.minX + 95
        }, completion: nil)
            turnAudioPlayer?.play()
            leftSwipeCrash = true
            rightSwipeCrash = false
            }
        }
    
    @IBAction func moveRightSwipe(_ sender: Any) {
        if rightSwipeCrash == true {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveLinear], animations: {
            self.myCarImage.center.x = self.view.frame.maxX
            self.myCarImage.transform = self.myCarImage.transform.rotated(by: CGFloat.pi / 1.4)
            }, completion: nil)
            self.addAlertAndReturn()
            self.saveMyScore()
            self.gameOverTimer?.invalidate()
            
            crashAudioPlayer?.play()
            
            self.endGameImage.image = UIImage(named: "imageExplosion")
            
            self.firstRoadImage.layer.removeAllAnimations()
            self.secondRoadImage.layer.removeAllAnimations()
            self.leftStoneImage.layer.removeAllAnimations()
            self.rightStoneImage.layer.removeAllAnimations()
            self.leftBushImage.layer.removeAllAnimations()
            self.rightBushImage.layer.removeAllAnimations()
            
        } else if myCarImage.center.x + myCarImage.frame.width / 2 < self.view.frame.maxX - 70 {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
                self.myCarImage.center.x = self.view.frame.maxX - 95
        }, completion: nil)
            turnAudioPlayer?.play()
            leftSwipeCrash = false
            rightSwipeCrash = true
        }
    }
}


