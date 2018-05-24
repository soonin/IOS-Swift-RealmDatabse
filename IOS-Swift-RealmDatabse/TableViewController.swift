//
//  TableViewController.swift
//  IOS-Swift-RealmDatabse
//
//  Created by Pooya Hatami on 2018-05-18.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    
    @IBOutlet weak var tableview: UITableView!
    var CityArray:[CityLib] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        fetchData()
        tableview.reloadData()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath)
        let name = CityArray[indexPath.row]
        cell.textLabel!.text = name.cityName + " "
                            + name.provinceName + " "
                            + name.countryName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let city = CityArray[indexPath.row]
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.delete(city)
                CityArray.remove(at: indexPath.row)
            }
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    
    func fetchData() {
        let realm = try! Realm()
        
        CityArray = Array(realm.objects(CityLib.self))
        
        for person in CityArray {
            print("\(person.cityName) is in \(person.countryName)")
        }
    }
    
    
}
