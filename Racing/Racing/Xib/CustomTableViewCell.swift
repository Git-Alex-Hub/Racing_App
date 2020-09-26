import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customDateLabelTableView: UILabel!
    @IBOutlet weak var customScoreLabelTableView: UILabel!
    @IBOutlet weak var customImageTableView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customImageTableView.frame = CGRect(x: contentView.frame.size.width * 0.008, y: contentView.frame.height * 0.09, width: contentView.frame.size.width * 0.12, height: contentView.frame.height * 0.955)
        customScoreLabelTableView.frame = CGRect(x: contentView.frame.size.width * 0.142, y: 0, width: contentView.frame.size.width * 0.871, height: contentView.frame.height * 0.5)
        customDateLabelTableView.frame = CGRect(x: contentView.frame.size.width * 0.142, y: contentView.frame.height * 0.5, width: contentView.frame.size.width * 0.871, height: contentView.frame.height * 0.5)
    }

}
