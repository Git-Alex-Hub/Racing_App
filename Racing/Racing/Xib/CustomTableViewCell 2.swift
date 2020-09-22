import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customDateLabelTableView: UILabel!
    @IBOutlet weak var customScoreLabelTableView: UILabel!
    @IBOutlet weak var customImageTableView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customDateLabelTableView.font = UIFont(name: "Bangers", size: 20)
        customDateLabelTableView.textColor = UIColor.white
        
    }

}
