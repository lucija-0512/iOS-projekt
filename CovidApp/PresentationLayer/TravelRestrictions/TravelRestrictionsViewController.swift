import Foundation
import PureLayout

class TravelRestrictionsViewController : UIViewController {
    
    private var presenter: TravelRestrictionsDataPresenter!
    private var data = ["-negative PCR test or rapid antigen test - RAT on SARS-CoV-2","-certificate that they have received two doses of vaccine used in the EU, provided that 14 days have passed from the time they received the second dose or from the time they received the first dose if the vaccine is administered in a single dose (Janssen/Johnson&Johnson)","-certificate showing that they have received the first dose of the Pfizer, Moderna or Gamaleya vaccine, on the basis of which they can enter the Republic of Croatia in the period of 22 to 42 days from receiving the vaccine, or 22 to 84 days from receiving the first dose of the AstraZeneca vaccine", "-certificate showing that they have recovered from COVID-19 and have received one dose of vaccine within six months from contracting the disease, provided that the vaccine was administered less than 180 days from their arrival at the border crossing point"]
    //private var data: [TravelRestriction] = []
    private var restrictions: UILabel!
    private var titleLabel: UILabel!
    private var labels : [UILabel] = []
    
    init(presenter: TravelRestrictionsDataPresenter) {
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
        
        //setData()
        
    }
    
    func buildViews() {
        view.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        titleLabel.numberOfLines = 3
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.text = "Information regarding the conditions of entry into the Republic of Croatia"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        restrictions = UILabel()
        restrictions.font = UIFont.boldSystemFont(ofSize: 20.0)
        restrictions.textColor = .white
        restrictions.numberOfLines = 2
        restrictions.lineBreakMode = .byWordWrapping
        restrictions.text = "Passengers travelling from an EU/EEA member state:"
        
        for i in self.data{
            let new = buildLabel(text: i)
            view.addSubview(new)
            labels.append(new)
        }
        
        view.addSubview(titleLabel)
        view.addSubview(restrictions)
    }
    
    /*func setData() {
        presenter.fetchData()  { data in
                self.data = data.dataList
                DispatchQueue.main.sync {
                    print(self.data)
                }
        }
    }*/
    
    func buildLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = .white
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.text = text
        
        return label
    }

    private func addConstraints() {
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 5)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        titleLabel
            .autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        
        restrictions.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
        restrictions.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        restrictions
            .autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 10)
        
        for i in labels{
            i.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 15)
            i.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 15)
            if labels.firstIndex(of: i)==0 {
                i.autoPinEdge(.top, to: .bottom, of: restrictions, withOffset: 10)
                continue
            }
            i.autoPinEdge(.top, to: .bottom, of: labels[labels.firstIndex(of: i)!-1], withOffset: 10)
        }
    }
}
