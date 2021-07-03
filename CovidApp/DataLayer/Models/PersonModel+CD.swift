import CoreData
import UIKit

extension PersonModel {

    init(with entity: Person) {
        name = entity.name
        surname = entity.surname
        dateOfBirth = entity.birthDate
        oib = entity.oib
    }

    func populate(_ entity: Person, in context: NSManagedObjectContext) {
        entity.name = name
        entity.surname = surname
        entity.birthDate = dateOfBirth
        entity.oib = oib
    }

}
