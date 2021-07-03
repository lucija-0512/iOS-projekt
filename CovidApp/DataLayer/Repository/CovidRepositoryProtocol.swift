protocol CovidRepositoryProtocol {
    func fetchCovidData(completion: @escaping (WorldData)-> Void)
    func fetchCovidNews(completion: @escaping ([WorldNews]) -> Void)
    func fetchCovidRestrictions(completion: @escaping ([TravelRestriction]) -> Void)
    func fetchVaccineNews(completion: @escaping ([WorldNews]) -> Void)
    func savePerson(person : PersonModel) -> Void
    func fetchAll() -> [PersonModel] 
}

