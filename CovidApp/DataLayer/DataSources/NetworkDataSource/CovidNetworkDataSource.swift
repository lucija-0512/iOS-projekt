import UIKit

class CovidNetworkDataSource : CovidNetworkServiceProtocol {
    func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (Result<T, RequestError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
        
            guard let data = data else
            {
                completionHandler(.failure(.noDataError))
                return
            }
            
            
            /*if data == data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    print(decodedResponse)
              } catch DecodingError.keyNotFound(let key, let context) {
                      Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                  } catch DecodingError.valueNotFound(let type, let context) {
                      Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                  } catch DecodingError.typeMismatch(let type, let context) {
                      Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                  } catch DecodingError.dataCorrupted(let context) {
                      Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                  } catch let error as NSError {
                      NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                  }
              return
            }*/
            
            guard let value = try? JSONDecoder().decode(T.self, from: data) else
            {
                completionHandler(.failure(.dataDecodingError))
                return
            }
            completionHandler(.success(value))
            
        }
        dataTask.resume()
    }
    
    
    func fetchWorldData(completion: @escaping (WorldData)-> Void) {
        let headers = [
            "x-rapidapi-key": "245b751144msh3ee40c8cb20cd60p1c8d76jsn5b7ac566c8a0",
            "x-rapidapi-host": "vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com"
        ]
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/npm-covid-data/world") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        executeUrlRequest(request) { (result: Result<[WorldData], RequestError>) in
                    switch result {
                                case .failure(let error):
                                    print(error)
                                case .success(let value):
                                    print("success")
                                    completion(value[0])
                    }
        }
    }
    
    func fetchWorldNews(completion: @escaping ([WorldNews]) -> Void){
        let headers = [
            "x-rapidapi-key": "33c4409579msh28646578186a55bp1fcfbcjsnab3851f74294",
            "x-rapidapi-host": "vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com"
        ]
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/news/get-coronavirus-news/0") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        executeUrlRequest(request) { (result: Result<News, RequestError>) in
                    switch result {
                                case .failure(let error):
                                    print(error)
                                case .success(let value):
                                    completion(value.news)
                    }
        }
    }
    
    func fetchCovidRestrictions(completion: @escaping ([TravelRestriction]) -> Void) {
        guard let url = URL(string: "https://covid-api.thinklumo.com/data/airport=BOS") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("8628a735aa0349488e1c60e9ad51ad42", forHTTPHeaderField: "Token")
        request.setValue("https://covid-api.thinklumo.com", forHTTPHeaderField: "Host")
        
        executeUrlRequest(request) { (result: Result<Restrictions, RequestError>) in
                    switch result {
                                case .failure(let error):
                                    print(error)
                                case .success(let value):
                                    completion(value.restrictions)
                    }
        }
    }
    
    func fetchVaccineNews(completion: @escaping ([WorldNews]) -> Void){
        let headers = [
            "x-rapidapi-key": "33c4409579msh28646578186a55bp1fcfbcjsnab3851f74294",
            "x-rapidapi-host": "vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com"
        ]
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/news/get-vaccine-news/1") else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        executeUrlRequest(request) { (result: Result<News, RequestError>) in
                    switch result {
                                case .failure(let error):
                                    print(error)
                                case .success(let value):
                                    completion(value.news)
                    }
        }
    }
}
