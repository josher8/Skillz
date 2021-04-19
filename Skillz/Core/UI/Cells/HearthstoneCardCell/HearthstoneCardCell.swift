import CellDataCoupler
import SDWebImage
import UIKit

struct HearthstoneCardData {
    var name: String
    var img: String
    
    init(name: String, img: String) {
        self.name = name
        self.img = img
    }
}

class HearthstoneCardCell: BaseTableViewCell<HearthstoneCardData> {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func setup() {
        nameLabel.text = info?.name
        
        if let imageUrl = info?.img {
            cardImageView.sd_setImage(with: URL(string: imageUrl))
        }
    }
    
}
