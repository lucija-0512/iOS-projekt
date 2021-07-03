class VaccinationApplicationsPresenter {
    private var coordinator: AppCoordinatorProtocol!
    private var covidUseCase: CovidDataUseCase!
    private var dataList : [PersonModel] = []

    init(covidUseCase: CovidDataUseCase, coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        self.covidUseCase = covidUseCase
    }
    
    func showApplications()-> [PersonModel] {
        dataList = covidUseCase.getAllApplications()
        return dataList
    }
    
    func rowCount() -> Int {
        return dataList.count
    }
}

