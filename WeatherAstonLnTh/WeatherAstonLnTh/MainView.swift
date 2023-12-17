//
//  MainView.swift
//  WeatherAstonLnTh
//
//  Created by Калякин Дима  on 17.12.2023.
//

import Foundation
import UIKit


class MainView: UIView{
    //MARK: - Property
    var tableView = UITableView()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstInitialization()
        self.setupConstraints()
        
    }
    
    
    //MARK: - private/public methods
    private func firstInitialization() {
        self.addSubview(tableView)
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    private func setupConstraints(){
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

