import Foundation
import PureLayout

class ArticleViewController : UIViewController {
    
    private var content: UITextView!
    private var presenter: CovidNewsDataPresenter!
    private var data: String!
    
    init(presenter: CovidNewsDataPresenter, data: String) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.data = data
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
        
    }
    
    func buildViews() {
        view.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        content = UITextView()
        content.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        content.isEditable = false
        content.font = UIFont.boldSystemFont(ofSize: 12.0)
        content.textColor = .white
        content.text = data
        
        view.addSubview(content)
    }

    private func addConstraints() {
        content.autoPinEdgesToSuperviewEdges()
    }
}
