//
//  CitiesListTableViewController.swift
//  Weather City List
//
//  Created by Vadym Sushko on 6/12/18.
//  Copyright © 2018 Vadym Sushko. All rights reserved.
//

import UIKit

class CitiesListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var cities = [City]()
    
    var orderedCities = [City]()
    
    
    var sectonsOfCities = [[City]]()
    
    var sectionsName = [String]()
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var searchCity = [City]()
    
    var searching = false
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCitiesList()
        putCitiesIntoSections()
        
        setSearchBar()
        
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.title = "Select city"
        myTableView.separatorColor = #colorLiteral(red: 0.1215686275, green: 0.1411764706, blue: 0.1529411765, alpha: 1)
        
    }
    
    func setSearchBar() {
        let textFieldInsideSearchBar = mySearchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1411764706, blue: 0.1529411765, alpha: 1)
        textFieldInsideSearchBar?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if searching {
            return 1
        } else {
            return sectonsOfCities.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching {
            return searchCity.count
        } else {
            return sectonsOfCities[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        if searching {
            cell.textLabel?.text = searchCity[indexPath.row].name
        } else {
            cell.textLabel?.text = sectonsOfCities[indexPath.section][indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1411764706, blue: 0.1529411765, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.bounds.size.width / 2, height: 30))
        label.textColor = UIColor.white
        if searching {
            label.text = ""
        } else {
            label.text = sectionsName[section]
        }
        headerView.addSubview(label)
        return headerView
    }
    
    
    // MARK: Segue from table view to collection view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addCity" {
            
            var desVC = segue.destination
            if let navController = desVC as? UINavigationController {
                desVC = navController.visibleViewController ?? desVC
            }
            if let desVC = segue.destination as? CitiesCollectionViewController {
                desVC.isCitySelected = true
                if searching {
                    desVC.selectedCityName = searchCity[(myTableView.indexPathForSelectedRow?.row)!].name
                    desVC.selectedCityId = Int32(searchCity[(myTableView.indexPathForSelectedRow?.row)!].id!)
                } else {
                    desVC.selectedCityName = sectonsOfCities[(myTableView.indexPathForSelectedRow?.section)!][(myTableView.indexPathForSelectedRow?.row)!].name
                    desVC.selectedCityId = Int32(sectonsOfCities[(myTableView.indexPathForSelectedRow?.section)!][(myTableView.indexPathForSelectedRow?.row)!].id!)
                }
            }
        }
    }
    
    
    // MARK: Loading Cities List
    func loadCitiesList() {
        
        if let jsonPath: String = Bundle.main.path(forResource: "city.list", ofType: "json"), let jsonData: Data = NSData(contentsOfFile: jsonPath) as Data? {
            do {
                self.cities = try JSONDecoder().decode([City].self, from: jsonData)
                orderedCities = cities.sorted { $0.name?.localizedCaseInsensitiveCompare($1.name!) == ComparisonResult.orderedAscending }
                orderedCities.removeSubrange(0...13)
            } catch {
                print("Error while deserialization of jsonData")
            }
        }
    }
    
    
    
    
    
    func putCitiesIntoSections() {
        let initialCharacter = orderedCities.first?.name!.first ?? "?"
        var numberOfSections = 1
        var sectionCharacter = initialCharacter
        
        for city in orderedCities {
            if city.name?.first != sectionCharacter
            {
                numberOfSections = numberOfSections + 1
                sectionCharacter = (city.name?.first)!
                sectionsName.append(String(sectionCharacter))
            }
        }
        for name in sectionsName {
            let section = orderedCities.filter({$0.name?.first == name.first})
            sectonsOfCities.append(section)
        }
    }
    
    
    // MARK: UISearchBarDelegate methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCity = orderedCities.filter({$0.name?.lowercased().prefix(searchText.count).description == searchText.lowercased()})
        searching = true
        if searchBar.text == ""
        {
            searching = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
            myTableView.reloadData()
        }
        myTableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        mySearchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.endEditing(true)
    }
    
    
}
