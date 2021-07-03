protocol CovidNetworkServiceProtocol {
    func fetchWorldData(completion: @escaping (WorldData)-> Void)
    func fetchWorldNews(completion: @escaping ([WorldNews]) -> Void)
    func fetchCovidRestrictions(completion: @escaping ([TravelRestriction]) -> Void)
    func fetchVaccineNews(completion: @escaping ([WorldNews]) -> Void)
}
