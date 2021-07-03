import UIKit

class CovidVaccinesNewsViewController: UIViewController {

    private var presenter: CovidVaccinesNewsPresenter!
    private var tableView : UITableView!
    private var titleLabel: UILabel!
    let cellIdentifier = "searchCellId"
    let headerIdentifier = "headerId"
    private var dataList : [WorldNews] = []
    let searchController = UISearchController(searchResultsController: nil)
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var filteredNews: [WorldNews] = []

    init(presenter: CovidVaccinesNewsPresenter) {
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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setData()
    }

    func setData() {
        presenter.fetchData()  { data in
            self.dataList = data.dataList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func buildViews() {
        view.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        titleLabel.textColor = .white
        titleLabel.text = "Covid World News"
        
        tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.register(CovidNewsCustomCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.isUserInteractionEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search News"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }

    private func addConstraints() {
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 30)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        tableView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        tableView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredNews = self.dataList.filter({(item: WorldNews) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

extension CovidVaccinesNewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && !isSearchBarEmpty {
            return filteredNews.count
        }
        return presenter.rowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CovidNewsCustomCell
        cell.selectionStyle = .none
        var data : WorldNews
        if searchController.isActive && !isSearchBarEmpty {
          data = filteredNews[indexPath.row]
        } else {
          data = dataList[indexPath.row]
        }
        cell.set(model: data)
        return cell
    }
}

extension CovidVaccinesNewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: dataList[indexPath.row].link),
                UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
        }
    }
}

extension CovidVaccinesNewsViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}
