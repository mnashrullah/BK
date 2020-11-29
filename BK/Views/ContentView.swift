//
//  ContentView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 14/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "primary")?.withAlphaComponent(0.3)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "text") ?? UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "text") ?? UIColor.black], for: .normal)
        //background color Form
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
            
    }
    
    //    @ObservedObject var observedData = obsevable()
    @ObservedObject var observableContent = ObservableContent()
    @ObservedObject var observableTips = ObservableTips()
    @State var user = ""
    @EnvironmentObject var userData: UserData
    var body: some View {
        HomeView()
            
            .navigationBarColor(UIColor(named: "bg"))
            .onAppear(){
//                loadContent()

            if (!UserDefaults.standard.bool(forKey: "isFirstTime")){
                print("isFirstTime load data")
                loadContent()
                UserDefaults.standard.set(true, forKey: "isFirstTime")
            }else{
                print("isFirstTime not load data")
            }
        }
//        NavigationView{
//            VStack{
//                VStack(){
//                    Button(action:{loadContent()}){Text("save all content")}
//                    Button(action:{deleteAllContent()}){Text("delete all content")}
//                }
//
//                List{
//                    Text("Milestone")
//                    ForEach(observableContent.data){i in
//                        Text("\(i.month) \(i.name) \(i.category) \(String(i.isComplete)) idmilestone:  \(i.idMilestone) id: \(i.id)")
//                    }.onDelete { (indexset) in
//                        //update and delete
//                        self.observableContent.updateComplete()
//                        self.observableContent.deleteData(indexset: indexset, id: self.observableContent.data[indexset.first!].id)
//                    }
//                }
//                List{
//                    Text("Tips")
//                    ForEach(observableTips.data){i in
//                        Text("\(i.month) \(i.name) \(i.category) idTips:  \(i.idTips) id: \(i.id)")
//                    }
//                }
//                Spacer()
//                    .navigationBarTitle("CoreData")
//            }
//        }
    }
    func loadContent(){
        print("loadcontent")
        deleteAllContent()
        for i in userData.miles{
            for j in i.milestone {
                self.observableContent.addData(
                    idMilestone: j.id,
                    month: j.month,
                    name: j.name,
                    category: j.category.rawValue,
                    isComplete: j.isComplete
                )
            }
            for j in i.tips{
                self.observableTips.addData(
                    idTips: j.id,
                    month: j.month,
                    name: j.name,
                    category: j.category.rawValue
                )
            }
        }
//        print(self.observableContent.data)
    }
    func deleteAllContent(){
        self.observableContent.deleteAllData()
        self.observableTips.deleteAllData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct datatypeMilestone : Identifiable {
    
    var id : NSManagedObjectID
    var idMilestone: Int
    var month: Int
    var name: String
    var category: String
    var isComplete: Bool
}

class ObservableContent : ObservableObject{
    
    @Published var data = [datatypeMilestone]()
    
    @Published var numberAllItem: Int = 0
    @Published var numberAllItemCompleted: Int = 0
    
    @Published var numberItemMotorik: Int = 0
    @Published var numberItemMotorikCompleted: Int = 0
    
    @Published var numberItemSosial: Int = 0
    @Published var numberItemSosialCompleted: Int = 0
    
    @Published var numberItemBahasa: Int = 0
    @Published var numberItemBahasaCompleted: Int = 0
    
    @Published var numberItemKognitif: Int = 0
    @Published var numberItemKognitifCompleted: Int = 0

    
    init() {
        loadData()
        countAll()
    }
    func loadData(){
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        let sort = NSSortDescriptor(key: "category", ascending: true)
        req.sortDescriptors = [sort]

//        @FetchRequest(entity: Book.entity(), sortDescriptors: [
//            NSSortDescriptor(keyPath: \Book.title, ascending: true),
//            NSSortDescriptor(keyPath: \Book.author, ascending: true)
//        ]) var books: FetchedResults<Book>
        //        MARK: Coredata load data milestone done
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeMilestone(
                        id: i.objectID,
                        idMilestone: i.value(forKey: "idMilestone") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String,
                        isComplete: i.value(forKey: "isComplete") as! Bool))
            }
        }
        catch{
            print("error")
        }
        
    }
    func loadByMonth(month: Int){
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        req.predicate = NSPredicate(format: "month == \(month)")
        let sort = NSSortDescriptor(key: "category", ascending: true)
        req.sortDescriptors = [sort]
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeMilestone(
                        id: i.objectID,
                        idMilestone: i.value(forKey: "idMilestone") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String,
                        isComplete: i.value(forKey: "isComplete") as! Bool))
            }
        }
        catch{
            print("error")
        }
        
    }
    
    func addData(idMilestone: Int, month: Int, name: String, category: String, isComplete: Bool){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TbMilestone", into: context)
        entity.setValue(idMilestone, forKey: "idMilestone")
        entity.setValue(month, forKey: "month")
        entity.setValue(name, forKey: "name")
        entity.setValue(category, forKey: "category")
        entity.setValue(isComplete, forKey: "isComplete")
        
        do{
            try context.save()
            data.append(datatypeMilestone(
                id: entity.objectID,
                idMilestone: idMilestone,
                month: month,
                name: name,
                category: category,
                isComplete: isComplete
            ))
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                if i.objectID == id{
                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
                    self.data.remove(atOffsets: indexset)
                }
            }
        }
        catch{
            print("error")
        }
    }
    
    func deleteAllData(){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: req)
        do{
            try context.execute(deleteRequest)
            try context.save()
            self.data = []
        }
        catch{
            print("error")
        }
    }
    
   
    func updateComplete(id: Int, isComplete: Bool){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        req.predicate = NSPredicate(format: "idMilestone = \(id)")
        do{
            let res = try context.fetch(req)
                if res.count == 1 {
                    let objectUpdate = res[0] as! NSManagedObject
                    objectUpdate.setValue(isComplete, forKey: "isComplete")
                    try context.save()
                    loadData()
                    countAll()
                }else{
                    print("data not found")
                }
        }
        catch{
            print("error")
        }
    }
    func countAll(){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let mCategory = ["Motorik","Sosial","Bahasa","Kognitif"]
//        var isComplete = [true, false]
        

        do{
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
            
            var res = try context.fetch(req)
            numberAllItem = res.count
            req.predicate = NSPredicate(format: "isComplete = true")
            res = try context.fetch(req)
            numberAllItemCompleted = res.count
            
            req.predicate = NSPredicate(format: "category = '\(mCategory[0])' && isComplete = true")
            res = try context.fetch(req)
            numberItemMotorikCompleted = res.count
            req.predicate = NSPredicate(format: "category = '\(mCategory[0])'")
            res = try context.fetch(req)
            numberItemMotorik = res.count
            
            req.predicate = NSPredicate(format: "category = '\(mCategory[1])' && isComplete = true")
            res = try context.fetch(req)
            numberItemSosialCompleted = res.count
            req.predicate = NSPredicate(format: "category = '\(mCategory[1])'")
            res = try context.fetch(req)
            numberItemSosial = res.count
            
            req.predicate = NSPredicate(format: "category = '\(mCategory[2])' && isComplete = true")
            res = try context.fetch(req)
            numberItemBahasaCompleted = res.count
            req.predicate = NSPredicate(format: "category = '\(mCategory[2])'")
            res = try context.fetch(req)
            numberItemBahasa = res.count
            
            req.predicate = NSPredicate(format: "category = '\(mCategory[3])' && isComplete = true")
            res = try context.fetch(req)
            numberItemKognitifCompleted = res.count
            req.predicate = NSPredicate(format: "category = '\(mCategory[3])'")
            res = try context.fetch(req)
            numberItemKognitif = res.count
            
        }
        catch{
            print("error")
        }
//        print("\(String(numberAllItemCompleted)) / \(String(numberAllItem))")
//        print("\(String(numberItemMotorikCompleted)) / \(String(numberItemMotorik))")
    }
}


struct datatypeChildMilestone : Identifiable {
    var id: NSManagedObjectID
    var idChild : Int
    var idMilestone: Int
    var month: Int
    var name: String
    var category: String
    var isComplete: Bool
}

class ObservableChildMilestone : ObservableObject{

    @Published var data = [datatypeChildMilestone]()
    let TbChildMilestone = "TbChildMilestone"
    var monthCategory:[Int] = []

    @Published var numberAllItem: Int = 0
    @Published var numberAllItemCompleted: Int = 0

    @Published var numberItemMotorik: Int = 0
    @Published var numberItemMotorikCompleted: Int = 0

    @Published var numberItemSosial: Int = 0
    @Published var numberItemSosialCompleted: Int = 0

    @Published var numberItemBahasa: Int = 0
    @Published var numberItemBahasaCompleted: Int = 0

    @Published var numberItemKognitif: Int = 0
    @Published var numberItemKognitifCompleted: Int = 0
    
    @Published var progressStatus = ""
    @Published var progressValue:Double = 0
    @Published var progressValueString: String = "0"


    init() {
//        loadData()
//        getMonth()
        getMonthCategory()
//        countAll()
    }
    func loadData(idChild: Int, month: Int){
//        getMonthCategory()
        countAll(idChild: idChild, month: month)
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        let monthSelected = decideMonth(month: month)
        req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected)")
        
//        let sort = NSSortDescriptor(key: "category", ascending: true)
//        req.sortDescriptors = [sort]
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeChildMilestone(
                        id: i.objectID,
                        idChild: i.value(forKey: "idChild") as! Int,
                        idMilestone: i.value(forKey: "idMilestone") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String,
                        isComplete: i.value(forKey: "isComplete") as! Bool))
            }
        }
        catch{
            print("error")
        }
    }
    func loadDataComplete(idChild: Int, month: Int){
        countAll(idChild: idChild, month: month)
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        let monthSelected = decideMonth(month: month)
        req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && isComplete == true")
        
//        let sort = NSSortDescriptor(key: "category", ascending: true)
//        req.sortDescriptors = [sort]
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeChildMilestone(
                        id: i.objectID,
                        idChild: i.value(forKey: "idChild") as! Int,
                        idMilestone: i.value(forKey: "idMilestone") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String,
                        isComplete: i.value(forKey: "isComplete") as! Bool))
            }
        }
        catch{
            print("error")
        }
    }
    func loadDataNotComplete(idChild: Int, month: Int){
        countAll(idChild: idChild, month: month)
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        let monthSelected = decideMonth(month: month)
        req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && isComplete == false")
        
//        let sort = NSSortDescriptor(key: "category", ascending: true)
//        req.sortDescriptors = [sort]
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeChildMilestone(
                        id: i.objectID,
                        idChild: i.value(forKey: "idChild") as! Int,
                        idMilestone: i.value(forKey: "idMilestone") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String,
                        isComplete: i.value(forKey: "isComplete") as! Bool))
            }
        }
        catch{
            print("error")
        }
    }
    
    
    func getMonthCategory(){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let reqMonth = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        reqMonth.returnsObjectsAsFaults = false
        reqMonth.propertiesToGroupBy = ["month"]
        reqMonth.propertiesToFetch = ["month"]
        reqMonth.resultType = .dictionaryResultType
        do{
            let results = try context.fetch(reqMonth)
            let data = results.map { (result) -> (Int)? in
                guard
                    let resultDict = result as? [String: Int],
                    let mMonth = resultDict["month"] else {
                        return nil
                    }
                self.monthCategory.append(mMonth)
                return mMonth
            }
            
        }
        catch{
            print("error")
        }
    }
    func firstLoadData(idChild: Int, month: Int){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
//        req.predicate = NSPredicate(format: "idChild == %@", idChild)

        req.predicate = NSPredicate(format: "idChild == \(idChild)")
        do{
            let res = try context.fetch(req)
            if (res.count == 0){
                print("firstLoadData")
                addData(idChild: idChild, month: month)
            } else{
                print("firstLoadData ignored")
            }
        }
        catch{
            print("error")
        }
    }
    
    func decideMonth(month: Int) -> Int{
        var monthSelected = 0
        for i in 0..<monthCategory.count {
            var startNumber = 0
            var endNumber = 0
            if i == 0 {
                startNumber = 0
                endNumber = monthCategory[i]
            } else if (i < monthCategory.count-1) {
                startNumber = monthCategory[i]
                endNumber = monthCategory[i+1]
            }
            if (month > startNumber && month <= endNumber){
                print("inside")
                monthSelected = monthCategory[i+1]
            }
            if (month > monthCategory[monthCategory.count-1]){
                print("inside")
                monthSelected = monthCategory[monthCategory.count-1]
  
            }
            if month <= 2 {
                print("inside")
                monthSelected = 2
            }

//            if (month > monthCategory[monthCategory.count-1]){
//                monthSelected = monthCategory[i+1]
//            }
//            if (month > 0 && month <= endNumber){
//                monthSelected = monthCategory[monthCategory.count-1]
//            }
//            if month == 0 {
//                monthSelected = 2
//            }
            
//
//            print("decideMonth \(month)")
//            print("decideMonth \(monthCategory)")
//            print("decideMonth \(monthSelected)")

        }
        
        print("addData month \(monthCategory)")
        print("addData month \(month)")
        print("addData month selected2 \(monthSelected)")
        return monthSelected
    }

    func addData(idChild: Int, month: Int){
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
//        MARK: mengambil bulan yang sesuai dengan data anak
        let monthSelected: Int = decideMonth(month: month)
//        print("count monthcategory\(monthCategory.count)")
        
//        MARK: mengambil data milestone yang sesuai dengan bulan
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
        req.predicate = NSPredicate(format: "month = \(monthSelected)")
        var tempData = [datatypeMilestone]()
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                let entity = NSEntityDescription.insertNewObject(forEntityName: TbChildMilestone, into: context)
                entity.setValue(idChild, forKey: "idChild")
                entity.setValue(i.value(forKey: "idMilestone") as! Int, forKey: "idMilestone")
                entity.setValue(i.value(forKey: "month") as! Int, forKey: "month")
                entity.setValue(i.value(forKey: "name") as! String, forKey: "name")
                entity.setValue(i.value(forKey: "category") as! String, forKey: "category")
                entity.setValue(i.value(forKey: "isComplete") as! Bool, forKey: "isComplete")
                do{
                    try context.save()
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        catch{
            print("error")
        }
        self.loadData(idChild: idChild, month: monthSelected)
        print("coba")
        print(data)
        
    }
    
   
//    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
////        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//        do{
//            let res = try context.fetch(req)
//            for i in res as! [NSManagedObject]{
//                if i.objectID == id{
//                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
//                    self.data.remove(atOffsets: indexset)
//                }
//            }
//        }
//        catch{
//            print("error")
//        }
//    }
//
//    func deleteAllData(){
//        //        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: req)
//        do{
//            try context.execute(deleteRequest)
//            try context.save()
//            self.data = []
//        }
//        catch{
//            print("error")
//        }
//    }
//
//
    
    func updateBatchComplete(idChild: Int, idMilestone: [Int], month: Int){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        var monthSelected = decideMonth(month: month)
        
        for i in idMilestone{
            print("update complete \(String(i))")
            req.predicate = NSPredicate(format: "idChild = \(idChild) && idMilestone = \(i) && month = \(monthSelected)")
            do{
                let res = try context.fetch(req)
                    if res.count == 1 {
                        let objectUpdate = res[0] as! NSManagedObject
                        objectUpdate.setValue(true, forKey: "isComplete")
                        try context.save()
                    }else{
                        print("data not found")
                    }
            }
            catch{
                print("error")
            }
        }
        loadData(idChild: idChild, month: month)
        countAll(idChild: idChild, month: month)
//
    }
    func updateBatchNotComplete(idChild: Int, idMilestone: [Int], month: Int){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        let monthSelected = decideMonth(month: month)
        
        for i in idMilestone{
            print("update complete \(String(i))")
            req.predicate = NSPredicate(format: "idChild = \(idChild) && idMilestone = \(i) && month = \(monthSelected)")
            do{
                let res = try context.fetch(req)
                    if res.count == 1 {
                        let objectUpdate = res[0] as! NSManagedObject
                        objectUpdate.setValue(false, forKey: "isComplete")
                        try context.save()
                    }else{
                        print("data not found")
                    }
            }
            catch{
                print("error")
            }
        }
        loadData(idChild: idChild, month: month)
        countAll(idChild: idChild, month: month)
//
    }
    
    
    func updateComplete(idChild: Int, idMilestone: Int, month: Int, isComplete: Bool){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
        var monthSelected = decideMonth(month: month)
        req.predicate = NSPredicate(format: "idChild = \(idChild) && idMilestone = \(idMilestone) && month = \(monthSelected)")
        do{
            let res = try context.fetch(req)
                if res.count == 1 {
                    let objectUpdate = res[0] as! NSManagedObject
                    objectUpdate.setValue(isComplete, forKey: "isComplete")
                    try context.save()
                    loadData(idChild: idChild, month: month)
                    countAll(idChild: idChild, month: month)
                }else{
                    print("data not found")
                }
        }
        catch{
            print("error")
        }
    }
    func countAll(idChild: Int, month: Int){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        var mCategory = ["Motorik","Sosial","Bahasa","Kognitif"]
        var isComplete = [true, false]
        let monthSelected = decideMonth(month: month)

        print("coba")
        print(monthSelected)
        print(idChild)
        

        do{
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: TbChildMilestone)
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected)")

            var res = try context.fetch(req)
            numberAllItem = res.count
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && isComplete = true")
            res = try context.fetch(req)
            numberAllItemCompleted = res.count

            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[0])' && isComplete = true")
            res = try context.fetch(req)
            numberItemMotorikCompleted = res.count
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[0])'")
            res = try context.fetch(req)
            numberItemMotorik = res.count

            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[1])' && isComplete = true")
            res = try context.fetch(req)
            numberItemSosialCompleted = res.count
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[1])'")
            res = try context.fetch(req)
            numberItemSosial = res.count

            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[2])' && isComplete = true")
            res = try context.fetch(req)
            numberItemBahasaCompleted = res.count
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[2])'")
            res = try context.fetch(req)
            numberItemBahasa = res.count

            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[3])' && isComplete = true")
            res = try context.fetch(req)
            numberItemKognitifCompleted = res.count
            req.predicate = NSPredicate(format: "idChild == \(idChild) && month == \(monthSelected) && category = '\(mCategory[3])'")
            res = try context.fetch(req)
            numberItemKognitif = res.count

        }
        catch{
            print("error")
        }
        
        progressValue = Double(numberAllItemCompleted) / Double(numberAllItem) * 100
        progressValueString = String(format: "%.1f", progressValue)
        if (progressValue >= 80){
            progressStatus = "Ideal"
        } else {
            progressStatus = "Biasa"
        }
        
        
        
        print("\(String(numberAllItemCompleted)) / \(String(numberAllItem))")
        print("\(String(numberItemMotorikCompleted)) / \(String(numberItemMotorik))")
    }
}



struct datatypeTips : Identifiable {
    
    var id : NSManagedObjectID
    var idTips: Int
    var month: Int
    var name: String
    var category: String
}

class ObservableTips : ObservableObject{
    
    @Published var data = [datatypeTips]()
    
    init() {
        loadData()
    }
    func loadData(){
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbTips")
        //        MARK: Coredata load data milestone done
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeTips(
                        id: i.objectID,
                        idTips: i.value(forKey: "month") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String
                    )
                )
            }
        }
        catch{
            print("error")
        }
        
    }
    func loadByMonth(month: Int){
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbTips")
        req.predicate = NSPredicate(format: "month == \(month)")
        let sort = NSSortDescriptor(key: "category", ascending: true)
        req.sortDescriptors = [sort]
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeTips(
                        id: i.objectID,
                        idTips: i.value(forKey: "month") as! Int,
                        month: i.value(forKey: "month") as! Int,
                        name: i.value(forKey: "name") as! String,
                        category: i.value(forKey: "category") as! String
                    )
                )
            }
        }
        catch{
            print("error")
        }
        
    }
    
    func addData(idTips: Int, month: Int, name: String, category: String){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TbTips", into: context)
        entity.setValue(idTips, forKey: "idTips")
        entity.setValue(month, forKey: "month")
        entity.setValue(name, forKey: "name")
        entity.setValue(category, forKey: "category")
        
        do{
            try context.save()
            data.append(datatypeTips(
                id: entity.objectID,
                idTips: idTips,
                month: month,
                name: name,
                category: category
            ))
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
//    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
////        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//        do{
//            let res = try context.fetch(req)
//            for i in res as! [NSManagedObject]{
//                if i.objectID == id{
//                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
//                    self.data.remove(atOffsets: indexset)
//                }
//            }
//        }
//        catch{
//            print("error")
//        }
//    }

    func deleteAllData(){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbTips")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: req)
        do{
            try context.execute(deleteRequest)
            try context.save()
            self.data = []
        }
        catch{
            print("error")
        }
    }
//
//
//    func updateComplete(){
////        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//        req.predicate = NSPredicate(format: "idMilestone = 5001")
//        do{
//            let res = try context.fetch(req)
//                if res.count == 1 {
//                    let objectUpdate = res[0] as! NSManagedObject
//                    objectUpdate.setValue(true, forKey: "isComplete")
//                    try context.save()
//                    loadData()
//                }else{
//                    print("data not found")
//                }
//        }
//        catch{
//            print("error")
//        }
//    }
}



struct datatypeChild : Identifiable {
    
    var id : NSManagedObjectID
    var idChild: Int
    var name: String
    var gender: String
    var birthDate: Date
    var month: Int
    var age: String
}

class ObservableChild : ObservableObject{
    @Published var data = [datatypeChild]()
    @Published var childSelected = datatypeChild.self
    var tableChild = "TbChild"
    
    init() {
        loadData()
    }
    func loadData(){
        data = []
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: tableChild)
        let sort = NSSortDescriptor(key: "name", ascending: true)
        req.sortDescriptors = [sort]
        
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                self.data.append(
                    datatypeChild(
                        id: i.objectID,
                        idChild: i.value(forKey: "idChild") as! Int,
                        name: i.value(forKey: "name") as! String,
                        gender: i.value(forKey: "gender") as! String,
                        birthDate: i.value(forKey: "birthDate") as! Date,
                        month: i.value(forKey: "month") as! Int,
                        age: i.value(forKey: "age") as! String

                    )
                )
            }
        }
        catch{
            print("error")
        }
    }
    
    func addData(name: String, gender: String, birthDate: Date){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: tableChild, into: context)
        let month = calcAgeMonth(birthday: birthDate)
        let age = calcAge(birthday: birthDate)
        let idChild = Int.random(in: 0...1000)
        entity.setValue(idChild, forKey: "idChild")
        entity.setValue(name, forKey: "name")
        entity.setValue(gender, forKey: "gender")
        entity.setValue(birthDate, forKey: "birthDate")
        entity.setValue(month, forKey: "month")
        entity.setValue(age, forKey: "age")
        
        do{
            try context.save()
            data.append(datatypeChild(
                id: entity.objectID,
                idChild: idChild,
                name: name,
                gender: gender,
                birthDate: birthDate,
                month: month,
                age: age
            ))
            loadData()
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
//        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName:tableChild)
        do{
            let res = try context.fetch(req)
            for i in res as! [NSManagedObject]{
                if i.objectID == id{
                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
                    self.data.remove(atOffsets: indexset)
                }
            }
        }
        catch{
            print("error")
        }
    }

    func deleteAllData(){
        //        MARK: Coredata add data milestone done
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: tableChild)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: req)
        do{
            try context.execute(deleteRequest)
            try context.save()
            self.data = []
        }
        catch{
            print("error")
        }
    }
//    func calcAge(birthday: Date) -> String {
//        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
//        let now = Date()
//        let calcAge = calendar.components([.year, .month, .day], from: birthday, to: now, options: [])
//        let age: Int = calcAge.year ?? 0
//        let month: Int = calcAge.month ?? 0
//        let day: Int = calcAge.day ?? 0
//        var result : String = ""
//        if (age > 0){
//            result = "Umur \(age) tahun \(month) bulan"
//        } else if (age == 0 && month > 0){
//            result = "Umur \(month) bulan \(day) hari"
//        } else if (age == 0 && month == 0 && day > 0){
//            result = "Umur \(day) hari"
//        } else if (age == 0 && month == 0 && day == 0){
//            result = "Umur \(day+1) hari"
//        } else {
//            result = ""
//        }
//        return result
//    }

//
//    func updateComplete(id: Int, isComplete: Bool){
////        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//        req.predicate = NSPredicate(format: "idMilestone = \(id)")
//        do{
//            let res = try context.fetch(req)
//                if res.count == 1 {
//                    let objectUpdate = res[0] as! NSManagedObject
//                    objectUpdate.setValue(isComplete, forKey: "isComplete")
//                    try context.save()
//                    loadData()
//                    countAll()
//                }else{
//                    print("data not found")
//                }
//        }
//        catch{
//            print("error")
//        }
//    }
//    func countAll(){
////        MARK: Coredata add data milestone done
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        var mCategory = ["Motorik","Sosial","Bahasa","Kognitif"]
//        var isComplete = [true, false]
//
//
//        do{
//            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "TbMilestone")
//
//            var res = try context.fetch(req)
//            numberAllItem = res.count
//            req.predicate = NSPredicate(format: "isComplete = true")
//            res = try context.fetch(req)
//            numberAllItemCompleted = res.count
//
//            req.predicate = NSPredicate(format: "category = '\(mCategory[0])' && isComplete = true")
//            res = try context.fetch(req)
//            numberItemMotorikCompleted = res.count
//            req.predicate = NSPredicate(format: "category = '\(mCategory[0])'")
//            res = try context.fetch(req)
//            numberItemMotorik = res.count
//
//            req.predicate = NSPredicate(format: "category = '\(mCategory[1])' && isComplete = true")
//            res = try context.fetch(req)
//            numberItemSosialCompleted = res.count
//            req.predicate = NSPredicate(format: "category = '\(mCategory[1])'")
//            res = try context.fetch(req)
//            numberItemSosial = res.count
//
//            req.predicate = NSPredicate(format: "category = '\(mCategory[2])' && isComplete = true")
//            res = try context.fetch(req)
//            numberItemBahasaCompleted = res.count
//            req.predicate = NSPredicate(format: "category = '\(mCategory[2])'")
//            res = try context.fetch(req)
//            numberItemBahasa = res.count
//
//            req.predicate = NSPredicate(format: "category = '\(mCategory[3])' && isComplete = true")
//            res = try context.fetch(req)
//            numberItemKognitifCompleted = res.count
//            req.predicate = NSPredicate(format: "category = '\(mCategory[3])'")
//            res = try context.fetch(req)
//            numberItemKognitif = res.count
//
//        }
//        catch{
//            print("error")
//        }
////        print("\(String(numberAllItemCompleted)) / \(String(numberAllItem))")
////        print("\(String(numberItemMotorikCompleted)) / \(String(numberItemMotorik))")
//    }
}

