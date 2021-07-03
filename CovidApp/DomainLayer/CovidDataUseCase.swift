class CovidDataUseCase {
    private let covidRepository: CovidRepositoryProtocol

    init(covidRepository: CovidRepositoryProtocol) {
        self.covidRepository = covidRepository
    }
    
    func fetchCovidData(completion: @escaping (WorldData)-> Void) {
        covidRepository.fetchCovidData()  { data in
            completion(data)
       }
    }
    
    func fetchCovidNews(completion: @escaping ([WorldNews])-> Void) {
        covidRepository.fetchCovidNews() { data in
            completion(data)
       }
    }
    
    func fetchCovidRestrictions(completion: @escaping ([TravelRestriction]) -> Void){
        covidRepository.fetchCovidRestrictions() { data in
             completion(data)
        }
    }
    
    func fetchVaccineNews(completion: @escaping ([WorldNews]) -> Void){
        covidRepository.fetchVaccineNews() { data in
             completion(data)
        }
    }
    
    func savePerson(person : PersonModel) -> Void {
        covidRepository.savePerson(person: person)
    }
    
    func getAllApplications() -> [PersonModel] {
        covidRepository.fetchAll()
    }
}
