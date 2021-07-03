class CovidNewsDataPresenter {
    private var coordinator: AppCoordinatorProtocol!
    private var covidUseCase: CovidDataUseCase!
    private var dataList : [WorldNews] = []

    init(covidUseCase: CovidDataUseCase, coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        self.covidUseCase = covidUseCase
    }
    
    func fetchData(completion: @escaping (WorldNewsDataViewModel)-> Void) {
        covidUseCase.fetchCovidNews()  { data in
            let worldNewsViewModel = WorldNewsDataViewModel(data)
            self.dataList = worldNewsViewModel.dataList
            completion(worldNewsViewModel)
       }
    }
    
    func rowCount() -> Int {
        return dataList.count
    }
    
}
