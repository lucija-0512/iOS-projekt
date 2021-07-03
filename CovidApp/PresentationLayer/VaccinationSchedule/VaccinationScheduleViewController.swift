import UIKit

class VaccinationScheduleViewController: UIViewController {

    private var presenter: VaccinationScheduleDataPresenter!
    private var name: UITextField!
    private var surname: UITextField!
    private var oib: UITextField!
    private var dateLabel : UILabel!
    private var birthDate: UITextField!
    private var applyButton : UIButton!
    private var titleLabel : UILabel!
    private var datepicker : UIDatePicker!
    

    init(presenter: VaccinationScheduleDataPresenter) {
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
    }
     
    
    private func buildViews() {
        view.backgroundColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        
        titleLabel = UILabel()
        titleLabel.text = "Apply for COVID-19 vaccination!"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        name = UITextField()
        name.backgroundColor = .lightGray
        name.textColor = .white
        name.placeholder = "Name"
        name.layer.cornerRadius = 20.0
        name.layer.borderWidth = 1.0
        name.layer.borderColor = UIColor.white.cgColor
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        name.leftView = leftView
        name.leftViewMode = .always
        name.font = UIFont.systemFont(ofSize: 20.0)
        
        surname = UITextField()
        surname.backgroundColor = .lightGray
        surname.textColor = .white
        surname.placeholder = "Surname"
        surname.layer.cornerRadius = 20.0
        surname.layer.borderWidth = 1.0
        surname.layer.borderColor = UIColor.white.cgColor
        let leftView2 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        surname.leftView = leftView2
        surname.leftViewMode = .always
        surname.font = UIFont.systemFont(ofSize: 20.0)
        
        oib = UITextField()
        oib.backgroundColor = .lightGray
        oib.textColor = .white
        oib.placeholder = "OIB"
        oib.layer.cornerRadius = 20.0
        oib.layer.borderWidth = 1.0
        oib.layer.borderColor = UIColor.white.cgColor
        let leftView3 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        oib.leftView = leftView3
        oib.leftViewMode = .always
        oib.font = UIFont.systemFont(ofSize: 20.0)
        
        dateLabel = UILabel()
        dateLabel.text = "Date of birth:"
        dateLabel.textColor = .white
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        birthDate = UITextField()
        datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        birthDate.inputView = datepicker
        
        applyButton = UIButton()
        applyButton.setTitle("Apply", for: .normal)
        applyButton.backgroundColor = .white
        applyButton.layer.cornerRadius = 20.0
        applyButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        applyButton.setTitleColor(UIColor(red: 0.1608, green: 0.502, blue: 0.7765, alpha: 1.0), for: .normal)
        applyButton.addTarget(self, action: #selector(customAction), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(name)
        view.addSubview(surname)
        view.addSubview(oib)
        view.addSubview(dateLabel)
        view.addSubview(birthDate)
        view.addSubview(datepicker)
        view.addSubview(applyButton)
    }
    @objc
    func customAction() {
        guard let nameField = name.text else { return }
        guard let surnameField = surname.text else { return }
        guard let oibField = oib.text else { return }
        if (nameField == "" || surnameField == "" || oibField == "") {
            return
        }
        let person = PersonModel(name: nameField, surname: surnameField, dateOfBirth: datepicker.date, oib: oibField)
        presenter.saveApplication(person: person)
        
     }

    
    private func addConstraints() {
        titleLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 40)
        titleLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 10)
        
        name.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 50)
        name.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        name.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        name.autoSetDimension(.height, toSize: 50)
        
        surname.autoPinEdge(.top, to: .bottom, of: name, withOffset: 10)
        surname.autoAlignAxis(.vertical, toSameAxisOf: name)
        surname.autoMatch(.height, to: .height, of: name)
        surname.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        surname.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        
        oib.autoPinEdge(.top, to: .bottom, of: surname, withOffset: 10)
        oib.autoAlignAxis(.vertical, toSameAxisOf: name)
        oib.autoMatch(.height, to: .height, of: name)
        oib.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        oib.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        
        dateLabel.autoPinEdge(.top, to: .bottom, of: oib, withOffset: 10)
        dateLabel.autoAlignAxis(.vertical, toSameAxisOf: name)
        dateLabel.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        
        birthDate.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 10)
        birthDate.autoAlignAxis(.vertical, toSameAxisOf: name)
        birthDate.autoMatch(.height, to: .height, of: name)
        birthDate.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        birthDate.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        
        datepicker.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 10)
        datepicker.autoAlignAxis(.vertical, toSameAxisOf: name)
        datepicker.autoMatch(.height, to: .height, of: name)
        datepicker.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        datepicker.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
        
        applyButton.autoPinEdge(.top, to: .bottom, of: birthDate, withOffset: 30)
        applyButton.autoAlignAxis(.vertical, toSameAxisOf: birthDate)
        applyButton.autoMatch(.height, to: .height, of: birthDate)
        applyButton.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 30)
        applyButton.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 30)
    }
    

}
