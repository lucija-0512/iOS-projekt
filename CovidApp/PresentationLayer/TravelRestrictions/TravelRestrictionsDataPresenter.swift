class TravelRestrictionsDataPresenter {
    private var coordinator: AppCoordinatorProtocol!
    private var covidUseCase: CovidDataUseCase!

    init(covidUseCase: CovidDataUseCase, coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        self.covidUseCase = covidUseCase
    }
    
}
