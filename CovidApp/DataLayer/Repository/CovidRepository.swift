class CovidRepository : CovidRepositoryProtocol {
    private let networkDataSource: CovidNetworkServiceProtocol
    private let coreDataSource: CovidCoreDataProtocol

    init(networkDataSource: CovidNetworkServiceProtocol, coreDataSource: CovidCoreDataProtocol) {
        self.networkDataSource = networkDataSource
        self.coreDataSource = coreDataSource
    }
    
    func fetchCovidData(completion: @escaping (WorldData)-> Void) {
        networkDataSource.fetchWorldData()  { data in
            completion(data)
       }
    }
    
    func fetchCovidNews(completion: @escaping ([WorldNews])-> Void) {
        networkDataSource.fetchWorldNews()  { data in
            completion(data)
       }
    }
    
    func fetchCovidRestrictions(completion: @escaping ([TravelRestriction]) -> Void) {
        networkDataSource.fetchCovidRestrictions()  { data in
            completion(data)
       }
    }
    
    func fetchVaccineNews(completion: @escaping ([WorldNews]) -> Void) {
        networkDataSource.fetchVaccineNews()  { data in
             completion(data)
        }
    }
    
    func savePerson(person : PersonModel) -> Void {
        coreDataSource.saveNewPerson(person)
    }
    
    func fetchAll() -> [PersonModel] {
        coreDataSource.fetchAll()
    }
    
    
}
