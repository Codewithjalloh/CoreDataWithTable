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
    
    // properties 
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
        movie.setValue("The Hobbit ", forKey: "title")
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

    // load table function
    func loadTable() {
        let request = NSFetchRequest(entityName: "Movie")
        request.returnsObjectsAsFaults = false
        results = try! context.executeFetchRequest(request)
        
    }
    
    // MARK: TABLE DATA SOURCE 
    // return the number of rows in section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    // return cell for row at index
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: myTableViewCell = tableView.dequeueReusableCellWithIdentifier("myTabVC") as! myTableViewCell
        let aux = results[indexPath.row] as! NSManagedObject
        cell.title.text = aux.valueForKey("title") as? String
        cell.director.text = aux.valueForKey("director") as? String
        cell.year.text = aux.valueForKey("year") as? String
        cell.myImage.image = UIImage(named: aux.valueForKey("image") as! String)
        
        return cell
        
    }

}

