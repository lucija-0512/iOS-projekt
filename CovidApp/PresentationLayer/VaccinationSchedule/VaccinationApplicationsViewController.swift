
import UIKit

class VaccinationApplicationsViewController: UIViewController {

    private var presenter: VaccinationApplicationsPresenter!
    private var titleLabel : UILabel!
    private var total : UILabel!
    private var tableView : UITableView!
    let cellIdentifier = "applicationCellId"
    private var dataList : [PersonModel] = []
    
    init(presenter: VaccinationApplicationsPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
        
        setData()
    }
    
    func setData() {
        dataList = presenter.showApplications()
        total.text = "Total applications: \(dataList.count)"
        tableView.reloadData()
    }
     
    
    private func buildViews() {
        view.backgroundColor = UIColor(red: 0.4431, green: 0.8078, blue: 0.5294, alpha: 1.0)
        
        titleLabel = UILabel()
        titleLabel.text = "Success!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
        
        total = UILabel()
        total.text = "Total number: "
        total.textColor = .white
        total.font = UIFont.boldSystemFont(ofSize: 30.0)
        
        tableView = UITableView()
        tableView.rowHeight = 50
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.isUserInteractionEnabled = true
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        view.addSubview(titleLabel)
        view.addSubview(total)
        view.addSubview(tableView)
    }
    
    
    
    private func addConstraints() {
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 10)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        total.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 40)
        total.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        tableView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        tableView.autoPinEdge(.top, to: .bottom, of: total, withOffset: 20)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

extension VaccinationApplicationsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ScheduleTableViewCell
        cell.selectionStyle = .none
        let data = dataList[indexPath.row]
        cell.set(model: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}


