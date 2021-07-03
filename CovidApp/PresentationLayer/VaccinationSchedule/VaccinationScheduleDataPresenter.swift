class VaccinationScheduleDataPresenter {
    private var coordinator: AppCoordinatorProtocol!
    private var covidUseCase: CovidDataUseCase!

    init(covidUseCase: CovidDataUseCase, coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
        self.covidUseCase = covidUseCase
    }
    
    func saveApplication(person: PersonModel) -> Void {
        covidUseCase.savePerson(person: person)
        
        coordinator.goToVaccinationApplicationVC()
    }
    
}
