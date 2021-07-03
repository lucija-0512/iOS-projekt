import UIKit
import PureLayout

class CovidNewsCustomCell: UITableViewCell {

    var title : UILabel!
    var imageURL : String!
    //var content : UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            buildViews()
            addConstraints()
        }

    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        title = UILabel()
        title.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        title.textColor = .white
        title.numberOfLines = 5
        title.lineBreakMode = .byWordWrapping
        /*content = UITextView()
        content.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        content.isEditable = false
        content.font = UIFont.boldSystemFont(ofSize: 12.0)
        content.textColor = .white*/
        
        addSubview(title)
        //addSubview(content)
    }
    
    private func addConstraints() {
        //title.autoAlignAxis(toSuperviewAxis: .horizontal)
        title.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        title.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        title.autoPinEdge(toSuperviewSafeArea: .top, withInset: 5)
        title.autoPinEdge(toSuperviewEdge: .bottom)
        
        /*content.autoPinEdge(.top, to: .bottom, of: title, withOffset: 10)
        content.autoAlignAxis(toSuperviewAxis: .horizontal)
        content.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)*/
    }
    
    func set(model: WorldNews) {
        title.text = model.title
        imageURL = model.imageURL
        //content.text = model.content
    }
}
