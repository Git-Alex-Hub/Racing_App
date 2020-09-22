import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scoreTableView: UITableView!
    
    private var dateFormatter: DateFormatter?
    private let cellIdentifier = "score"
    private let numberOfResult: [String] = [UserDefaults.standard.string(forKey: UserOptionsKey.scoreKey.rawValue)!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "dd MMM yyyy hh:mm:ss"
        
        backButton.setTitle(NSLocalizedString("back_button", comment: ""), for: .normal)
        myScoreLabel.text = NSLocalizedString("my_score", comment: "")
        
        changeFontLabel(label: myScoreLabel, size: 35)
        changeFontButton(button: backButton, size: 20)

        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        if (UserDefaults.standard.string(forKey: UserOptionsKey.scoreKey.rawValue) == nil) {
            scoreTableView.frame = CGRect(x: 0, y: Int(view.frame.width) / 3 * 2, width: Int(view.frame.width), height: 44 * 1)
        } else {
        scoreTableView.frame = CGRect(x: 0, y: Int(view.frame.width) / 3 * 2, width: Int(view.frame.width), height: 44 * numberOfResult.count)
        }
        scoreTableView.register(UINib(nibName: "CustomTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ScoreViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (UserDefaults.standard.string(forKey: UserOptionsKey.scoreKey.rawValue) == nil) {
            return 1
        } else {
        return numberOfResult.count
        }
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
