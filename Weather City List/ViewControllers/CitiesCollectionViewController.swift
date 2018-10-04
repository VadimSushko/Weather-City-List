//
//  CitiesCollectionViewController.swift
//  Weather City List
//
//  Created by Vadym Sushko on 9/27/18.
//  Copyright © 2018 Vadym Sushko. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "CollectionCell"

class CitiesCollectionViewController: UICollectionViewController, URLSessionDelegate {

    var manegedObjectContext: NSManagedObjectContext!
    
    var citiesFromBase: [NewCity] = []
    
    var selectedCityName: String?
    var selectedCityId: Int32?
    var isCitySelected: Bool = false

    var loadedWeatherDict = [String: WeatherForecast]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        manegedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        navBarSerUp()
        setUpLayout()
        loadData()
        
        if citiesFromBase.isEmpty
        {
            createNewCity(name: "Kiev", id: 703448)
            createNewCity(name: "London", id: 2643743)
        }
        
        self.clearsSelectionOnViewWillAppear = false

    }

    
    func navBarSerUp() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Cities"
    }
    
    func setUpLayout() {
        let itemSize = UIScreen.main.bounds.width / 3 - 4.5
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 15, left: 3, bottom: 3, right: 3)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        collectionView?.collectionViewLayout = layout
    }
    
    
    // MARK: Loading Data from Data Base
    
    func loadData() {
        let citiesFetch: NSFetchRequest<NewCity> = NewCity.fetchRequest()
        do {
            citiesFromBase = try manegedObjectContext.fetch(citiesFetch)
            
            collectionView?.reloadData()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Checking for uniqueness of city
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        var unique = true
        
        for i in citiesFromBase {
            if i.id == selectedCityId {
                unique = false
            }
        }
        if unique {
            if isCitySelected {
                createNewCity(name: selectedCityName!, id: selectedCityId!)
            }
        }
        unique = false
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return citiesFromBase.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CityCollectionViewCell
        
        let url = "http://api.openweathermap.org/data/2.5/forecast?id=" + String(describing: citiesFromBase[indexPath.item].id) + "&appid=c3c073e7497ba6d35f1a81ec769e5896"
        
        let urlObj = URL(string: url)
        
        let session = URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
            
            do {
                let weatherForecast = try JSONDecoder().decode(WeatherForecast.self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.loadedWeatherDict.updateValue(weatherForecast, forKey: (weatherForecast.city?.name)!)
                    
                    cell.collectionCellCityLabel.text = weatherForecast.city?.name
                    
                    let temperature = String(describing:
                        Int((((weatherForecast.list?[0].main?.temp_max)! - 273.15).rounded()))) + "/"
                        + String(describing:
                            Int((((weatherForecast.list?[0].main?.temp_min)! - 273.15).rounded()))) + " ℃"
                    
                    cell.collectionCellTemperature.text = temperature
                    
                    switch weatherForecast.list?[0].weather![0].description {
                    case "light rain"?:
                        cell.collectionCellImage.image = UIImage(named:"Weather5")
                    case "overcast clouds"?:
                        cell.collectionCellImage.image = UIImage(named:"Weather1")
                    case "clear sky"?, "few clouds"?:
                        cell.collectionCellImage.image = UIImage(named:"Weather3")
                    case "scattered clouds"?, "broken clouds"?:
                        cell.collectionCellImage.image = UIImage(named:"Weather4")
                    default:
                        cell.collectionCellImage.image = UIImage(named:"Weather3")
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
        
        return cell
    }
    
    // MARK: Transfer data to DetailVC
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = mainStoryBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailWeatherViewController
        detailVC.weatherForecast = loadedWeatherDict[citiesFromBase[indexPath.item].name!]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    
    // MARK: Create New City for Data Base
    
    func createNewCity(name: String, id: Int32) {
        
        let newCity = NewCity(context: manegedObjectContext)
        newCity.name = name
        newCity.id = id
        
        do{
            try manegedObjectContext.save()
            loadData()
        } catch {
            print("Could not save data \(error.localizedDescription)")
        }
        
        isCitySelected = false
    }
    
}
