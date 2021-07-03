import CoreData

class CovidCoreDataSource : CovidCoreDataProtocol {
    private let coreDataContext: NSManagedObjectContext

    init(coreDataContext: NSManagedObjectContext) {
        self.coreDataContext = coreDataContext
    }
    
    func saveNewPerson(_ person: PersonModel) {
            do {
                let cdPerson = try fetchPerson(withId: person.oib) ?? Person(context: coreDataContext)
                person.populate(cdPerson, in: coreDataContext)
            } catch {
                print("Error when creating a person: \(error)")
            }

            do {
                try coreDataContext.save()
            } catch {
                print("Error when saving person: \(error)")
            }
        
    }
    
    private func fetchPerson(withId oib: String) throws -> Person? {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %u", #keyPath(Person.oib), oib)
        let cdResponse = try coreDataContext.fetch(request)
        return cdResponse.first
    }
    
    func fetchAll() -> [PersonModel] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            return try coreDataContext.fetch(request).map { PersonModel(with: $0) }
        } catch {
            print("Error when fetching quizzes from core data: \(error)")
            return []
        }
    }
    
    private func deleteAll() {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let quizzesToDelete = try coreDataContext.fetch(request)
            quizzesToDelete.forEach { coreDataContext.delete($0) }
            try coreDataContext.save()
        } catch {
            print("Error when deleting: \(error)")
        }
        
    }
}
