import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scoreTableView: UITableView!
    @IBOutlet weak var garageImage: UIImageView!
    
    private var dateFormatter: DateFormatter?
    private let cellIdentifier = "score"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewHeight = view.frame.size.height
        let viewWidth = view.frame.size.width
        
        backButton.frame = CGRect(x: viewWidth * 0.03, y: viewHeight * 0.05, width: viewWidth * 0.266, height: viewHeight * 0.056)
        myScoreLabel.frame = CGRect(x: viewWidth * 0.024, y: viewHeight * 0.145, width: viewWidth * 0.966, height: viewHeight * 0.056)
        garageImage.frame = CGRect(x: 0, y: viewHeight * 0.859, width: viewWidth, height: viewHeight * 0.189)
        scoreTableView.frame = CGRect(x: 0, y: viewHeight * 0.223, width: viewWidth, height: 44)
        scoreTableView.register(UINib(nibName: "CustomTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "dd MMM yyyy hh:mm:ss"
        
        backButton.setTitle(NSLocalizedString("back_button", comment: ""), for: .normal)
        myScoreLabel.text = NSLocalizedString("my_score", comment: "")

        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ScoreViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scoreCell = scoreTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let customScoreCell = scoreCell as? CustomTableViewCell else {
            return scoreCell
        }
        if (UserDefaults.standard.string(forKey: UserOptionsKey.scoreKey.rawValue) == nil) {
            customScoreCell.customDateLabelTableView.text = NSLocalizedString("date", comment: "") + ": -"
            customScoreCell.customScoreLabelTableView.text = NSLocalizedString("score", comment: "") + ": 0"
        } else {
            let date = UserDefaults.standard.value(forKey: UserOptionsKey.dateKey.rawValue) as! Date
            let dateString = dateFormatter?.string(from: date)
            customScoreCell.customDateLabelTableView.text = NSLocalizedString("date", comment: "") + ": \(dateString!)"
            customScoreCell.customScoreLabelTableView.text = NSLocalizedString("score", comment: "") + ": \(UserDefaults.standard.string(forKey: UserOptionsKey.scoreKey.rawValue)!)"
        }
        return customScoreCell
    }
}
