import Foundation
import UIKit

class AppCoordinator : AppCoordinatorProtocol {
    private let navigationController = UINavigationController()
    private var window: UIWindow!

    init(window: UIWindow) {
        self.window = window
        setRootViewController()
    }
    
    private func setRootViewController() {
        let vc = createTabBarViewController()
        navigationController.viewControllers = [vc]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func createCovidDataViewController() -> CovidDataViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidDataRepository)
        let presenter = CovidDataPresenter(covidUseCase: covidUseCase, coordinator: self)
        return CovidDataViewController(presenter: presenter)
    }
    
    private func createCovidNewsViewController() -> CovidNewsViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidNewsDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidNewsDataRepository)
        let presenter = CovidNewsDataPresenter(covidUseCase: covidUseCase, coordinator: self)
        return CovidNewsViewController(presenter: presenter)
    }
    
    private func createTravelRestrictionsViewController() -> TravelRestrictionsViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let travelRestrictionsDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: travelRestrictionsDataRepository)
        let presenter = TravelRestrictionsDataPresenter(covidUseCase: covidUseCase, coordinator: self)
        return TravelRestrictionsViewController(presenter: presenter)
    }
    
    private func createVaccineNewsViewController() -> CovidVaccinesNewsViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidNewsDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidNewsDataRepository)
        let presenter = CovidVaccinesNewsPresenter(covidUseCase: covidUseCase, coordinator: self)
        return CovidVaccinesNewsViewController(presenter: presenter)
    }
    
    private func createVaccinationScheduleViewController() -> VaccinationScheduleViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidNewsDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidNewsDataRepository)
        let presenter = VaccinationScheduleDataPresenter(covidUseCase: covidUseCase, coordinator: self)
        return VaccinationScheduleViewController(presenter: presenter)
    }
    
    private func createVaccinationApplicationsViewController() -> VaccinationApplicationsViewController {
        let coreDataContext = CoreDataStack(modelName: "CovidApp").managedContext
        let covidNewsDataRepository = CovidRepository(
            networkDataSource: CovidNetworkDataSource(),
            coreDataSource: CovidCoreDataSource(coreDataContext: coreDataContext)
        )
        let covidUseCase = CovidDataUseCase(covidRepository: covidNewsDataRepository)
        let presenter = VaccinationApplicationsPresenter(covidUseCase: covidUseCase, coordinator: self)
        return VaccinationApplicationsViewController(presenter: presenter)
    }
    
    
    func createTabBarViewController() -> UIViewController {
        let imageTravel = UIImage(named: "airplane")
        let imageData = UIImage(named: "globe")
        let imageNews = UIImage(named: "doc.plaintext")
        let imageVaccine = UIImage(named: "eyedropper.halffull")
        let dataVC = createCovidDataViewController()
        dataVC.tabBarItem = UITabBarItem(title: "World Statistics", image: UIImage(systemName: "globe"), selectedImage: imageData)
        
        let newsVC = createCovidNewsViewController()
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "doc.plaintext"), selectedImage: imageNews)

        let restrictionsVC = createTravelRestrictionsViewController()
        restrictionsVC.tabBarItem = UITabBarItem(title: "Travel Restrictions",image: UIImage(systemName: "airplane"), selectedImage: imageTravel)
        
        let vaccineNewsVC = createVaccineNewsViewController()
        vaccineNewsVC.tabBarItem = UITabBarItem(title: "Vaccine News", image: UIImage(systemName: "eyedropper.halffull"), selectedImage: imageVaccine)
        
        let vaccinationScheduleVC = createVaccinationScheduleViewController()
        vaccinationScheduleVC.tabBarItem = UITabBarItem(title: "Apply", image: UIImage(systemName: "eyedropper.halffull"), selectedImage: imageVaccine)

        let tabBarViewController = UITabBarController()
        tabBarViewController.tabBar.tintColor = UIColor(red: 0.49, green: 0.78, blue: 0.94, alpha: 1.00)
        tabBarViewController.viewControllers = [dataVC, newsVC, restrictionsVC, vaccineNewsVC, vaccinationScheduleVC]

        return tabBarViewController
    }
    
    func goToVaccinationApplicationVC() {
        let vc = createVaccinationApplicationsViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
