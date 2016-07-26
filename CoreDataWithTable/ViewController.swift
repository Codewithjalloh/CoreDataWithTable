//
//  ViewController.swift
//  CoreDataWithTable
//
//  Created by wealthyjalloh on 26/07/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var results: NSArray! = NSArray()
    var appDel: AppDelegate!
    var context: NSManagedObjectContext!
    var request: NSFetchRequest!

    override func viewDidLoad() {
        super.viewDidLoad()
        appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext
        
        // code to add a movie 
        let movie = NSEntityDescription.insertNewObjectForEntityForName("Movie", inManagedObjectContext: context)
        movie.setValue("El Hobbit: Un viaje inesperado", forKey: "title")
        movie.setValue("2013", forKey: "year")
        movie.setValue("Peter Jackson", forKey: "director")
        movie.setValue("hobbit.jpg", forKey: "image")
        
        do {
            try context.save()
        } catch {
            print("Error!")
        }
        loadTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadTable() {
        let request = NSFetchRequest(entityName: "Movie")
        request.returnsObjectsAsFaults = false
        results = try! context.executeFetchRequest(request)
        
    }

}

