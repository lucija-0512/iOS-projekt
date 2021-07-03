import Foundation

struct NewsDataViewModel{
    var dataList: [(String,String)]
    
    init(_ data: News){
        self.dataList = [(String,String)]()
    }
}


