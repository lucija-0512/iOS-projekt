struct TravelRestrictionsDataViewModel {

    //var dataList : [(String,String)]
    var dataList : [TravelRestriction]

    init(_ data: [TravelRestriction]) {
        self.dataList = data
        /*self.dataList = [(String,String)]()
        self.dataList.append(("Destination country:", data.destination))
        self.dataList.append(("Summary:",data.summary))
        self.dataList.append(("Mask requirements:",data.maskRequirements))
        self.dataList.append(("Test types accepted:",data.testTypes))
        self.dataList.append(("Published on:", data.published))
        self.dataList.append(("Quarantine requirements:",data.quarantine))
        self.dataList.append(("Before timing:",data.beforeTiming))
        self.dataList.append(("Info source:", data.infoSource))*/
    }
}
