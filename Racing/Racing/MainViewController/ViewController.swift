import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myScoreClickButton: UIButton!
    @IBOutlet weak var myOptionsCarButton: UIButton!
    @IBOutlet weak var startRacingButton: UIButton!
    
    @IBOutlet weak var garageImage: UIImageView!
    @IBOutlet weak var speedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.frame.size.height
        let viewWidth = view.frame.size.width
        
        myScoreClickButton.frame = CGRect(x: viewWidth * 0.048, y: viewHeight * 0.05, width: viewWidth * 0.278, height: viewHeight * 0.055)
        myOptionsCarButton.frame = CGRect(x: viewWidth * 0.736, y: viewHeight * 0.05, width: viewWidth * 0.217, height: viewHeight * 0.055)
        startRacingButton.frame = CGRect(x: 0, y: viewHeight * 0.67, width: viewWidth, height: viewHeight * 0.067)
        
        speedImage.frame = CGRect(x: 0, y: viewHeight * 0.111, width: viewWidth, height: viewHeight * 0.368)
        garageImage.frame = CGRect(x: 0, y: viewHeight * 0.859, width: viewWidth, height: viewHeight * 0.189)
    
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
