protocol CovidCoreDataProtocol {
    func saveNewPerson(_ person: PersonModel)
    func fetchAll() -> [PersonModel] 
}
