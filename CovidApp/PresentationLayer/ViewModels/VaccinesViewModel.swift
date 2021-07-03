import UIKit

struct VaccinesViewModel {

    var dataList : [(String,String)]

    init(_ data: Vaccine) {
        self.dataList = [(String,String)]()
        self.dataList.append(("Total Cases:", data.researcher))
        self.dataList.append(("New Cases:", data.category))
        self.dataList.append(("Total deaths:", data.description))
        //self.dataList = data
        }
}
