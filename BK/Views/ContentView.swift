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
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "text")], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "text")], for: .normal)
        //background color Form
        UITableView.appearance().backgroundColor = .clear
            
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
            if (!UserDefaults.standard.bool(forKey: "isFirstTime")){
                loadContent()
                UserDefaults.standard.set(true, forKey: "isFirstTime")
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
        self.observableContent.deleteAllData()
        for i in userData.miles[0].milestone{
            self.observableContent.addData(
                idMilestone: i.id,
                month: i.month,
                name: i.name,
                category: i.category.rawValue,
                isComplete: i.isComplete
            )
        }
        for i in userData.miles[0].tips{
            self.observableTips.addData(
                idTips: i.id,
                month: i.month,
                name: i.name,
                category: i.category.rawValue
            )
        }
        
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
            print("sucess")
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
        var mCategory = ["Motorik","Sosial","Bahasa","Kognitif"]
        var isComplete = [true, false]
        

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
            print("sucess")
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
            print("delete all success")
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
    var name: String
    var gender: String
    var birthDate: Date
}

class ObservableChild : ObservableObject{
    @Published var data = [datatypeChild]()
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
                        name: i.value(forKey: "name") as! String,
                        gender: i.value(forKey: "gender") as! String,
                        birthDate: i.value(forKey: "birthDate") as! Date)
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
        entity.setValue(name, forKey: "name")
        entity.setValue(gender, forKey: "gender")
        entity.setValue(birthDate, forKey: "birthDate")
        
        do{
            try context.save()
            print("sucess add child")
            data.append(datatypeChild(
                id: entity.objectID,
                name: name,
                gender: gender,
                birthDate: birthDate
            ))
            loadData()
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
//
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
