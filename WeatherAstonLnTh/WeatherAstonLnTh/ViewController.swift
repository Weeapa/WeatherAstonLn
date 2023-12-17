//
//  ViewController.swift
//  WeatherAstonLnTh
//
//  Created by Калякин Дима  on 15.12.2023.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource {
 
    
    //MARK: - Property
    
    var timer = Timer()
    
    var contentView: MainView{
        return self.view as! MainView
    }
    
    var offerModel: OfferModel? {
        didSet{
            self.contentView.tableView.reloadData()
        }
    }
    
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationContoller()
        self.contentView.tableView.dataSource = self
    }
    
  
    
    
    //MARK: - Methods
    fileprivate func setupNavigationContoller(){
        self.navigationItem.title = "WeatherApp"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
       
    }
    
    
    //MARK: - Initializtions
    
    
    //MARK: - Delegate/Protocol methods
    func updateSearchResults(for searchController: UISearchController){

        let city = searchController.searchBar.text!
        
        timer.invalidate()
        
        if city != "" {
            timer = Timer.init(timeInterval: 0.5, repeats: false, block: { (timer) in
                NetworkManager.shared.getWeather(city: city) { (model) in
                    self.offerModel = model
                }
            })
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.offerModel!.list!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        
        return cell
    }
    
}

