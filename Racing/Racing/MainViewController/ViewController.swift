import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myScoreClickButton: UIButton!
    @IBOutlet weak var myOptionsCarButton: UIButton!
    @IBOutlet weak var startRacingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeFontButton(button: myScoreClickButton, size: 20)
        changeFontButton(button: myOptionsCarButton, size: 20)
        changeFontButton(button: startRacingButton, size: 40)
        
        gameAudioPlayer?.play()
        gameAudioPlayer?.numberOfLoops = -1
        gameAudioPlayer?.volume = 0.1
        
    }
    @IBAction func startRacingButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RacingStoryboard", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateInitialViewController() as! RacingViewController
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBAction func myScoreButton(_ sender: Any) {

        let storyboard = UIStoryboard(name: "ScoreStoryboard", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateInitialViewController() as! ScoreViewController
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBAction func myOptionsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "OptionsStoryboard", bundle: Bundle.main)
        let destenationViewController = storyboard.instantiateInitialViewController() as! OptionsViewController
        destenationViewController.modalPresentationStyle = .fullScreen
        present(destenationViewController, animated: true, completion: nil)
    }
}
