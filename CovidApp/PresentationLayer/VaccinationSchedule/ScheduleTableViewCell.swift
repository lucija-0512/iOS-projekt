import UIKit
import PureLayout

class ScheduleTableViewCell: UITableViewCell {

    var name : UILabel!
    var surname : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            buildViews()
            addConstraints()
        }

    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.backgroundColor = UIColor(red: 0.8157, green: 0.8471, blue: 0.8353, alpha: 1.0)
        
        name = UILabel()
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.textColor = .white
        surname = UILabel()
        surname.font = UIFont.boldSystemFont(ofSize: 18.0)
        surname.textColor = .white
        
        addSubview(name)
        addSubview(surname)
    }
    
    private func addConstraints() {
        name.autoAlignAxis(toSuperviewAxis: .horizontal)
        name.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        
        surname.autoPinEdge(.leading, to: .trailing, of: name, withOffset: 10)
        surname.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
    
    func set(model: PersonModel) {
        name.text = model.name
        surname.text = model.surname
    }
}
