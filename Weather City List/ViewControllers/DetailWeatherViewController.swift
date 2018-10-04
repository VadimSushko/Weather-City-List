//
//  DetailWeatherViewController.swift
//  Weather City List
//
//  Created by Vadym Sushko on 9/29/18.
//  Copyright © 2018 Vadym Sushko. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    var weatherForecast: WeatherForecast?
    
    
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var bigTemperatureLabel: UILabel!
    
    @IBOutlet weak var windImage: UIImageView!
    @IBOutlet weak var chanceImage: UIImageView!
    @IBOutlet weak var humidityImage: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var chanceLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var day1Image: UIImageView!
    @IBOutlet weak var day2Image: UIImageView!
    @IBOutlet weak var day3Image: UIImageView!
    @IBOutlet weak var day4Image: UIImageView!
    @IBOutlet weak var day5Image: UIImageView!
    
    @IBOutlet weak var day1Temp: UILabel!
    @IBOutlet weak var day2Temp: UILabel!
    @IBOutlet weak var day3Temp: UILabel!
    @IBOutlet weak var day4Temp: UILabel!
    @IBOutlet weak var day5Temp: UILabel!
 
    @IBOutlet weak var day1Name: UILabel!
    @IBOutlet weak var day2Name: UILabel!
    @IBOutlet weak var day3Name: UILabel!
    @IBOutlet weak var day4Name: UILabel!
    @IBOutlet weak var day5Name: UILabel!
    
    @IBOutlet weak var day1View: UIView!
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day3View: UIView!
    @IBOutlet weak var day4View: UIView!
    @IBOutlet weak var day5View: UIView!
    
    var day1ImageName:String?
    var day2ImageName:String?
    var day3ImageName:String?
    var day4ImageName:String?
    var day5ImageName:String?
    
    @IBAction func btn1Action(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.day1View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
            self.day2View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day3View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day4View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day5View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
        }

        bigTemperatureLabel.text = day1Temp.text! + "C"
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 0)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 0)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 0)
        bigImage.image = UIImage(named: day1ImageName! + "_Big")
    }
    
    @IBAction func btn2Action(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.day1View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day2View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
            self.day3View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day4View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day5View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
        }
        bigTemperatureLabel.text = day2Temp.text!  + "C"
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 8)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 8)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 8)
        bigImage.image = UIImage(named: day2ImageName! + "_Big")
    }
    
    @IBAction func btn3Action(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.day1View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day2View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day3View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
            self.day4View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day5View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
        }
        bigTemperatureLabel.text = day3Temp.text! + "C"
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 16)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 16)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 16)
        bigImage.image = UIImage(named: day3ImageName! + "_Big")
    }
    @IBAction func btn4Action(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.day1View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day2View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day3View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day4View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
            self.day5View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
        }
        bigTemperatureLabel.text = day4Temp.text! + "C"
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 24)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 24)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 24)
        bigImage.image = UIImage(named: day4ImageName! + "_Big")
    }
    @IBAction func btn5Action(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.day1View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day2View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day3View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day4View.backgroundColor = #colorLiteral(red: 0.1615198851, green: 0.1880342662, blue: 0.2031020522, alpha: 1)
            self.day5View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
        }
        bigTemperatureLabel.text = day5Temp.text! + "C"
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 32)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 32)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 32)
        bigImage.image = UIImage(named: day5ImageName! + "_Big")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpSmallImages()
        
        bigImage.image = UIImage(named: day1ImageName! + "_Big")
        setTemperatures()
        setDays()
        day1View.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.5098039216, blue: 0.137254902, alpha: 1)
        humidityLabel.text = getHumidity(forecast: weatherForecast!, index: 0)
        windLabel.text = getWindSpeed(forecast: weatherForecast!, index: 0)
        chanceLabel.text = getRainProbability(forecast: weatherForecast!, index: 0)
        
        humidityImage.image = UIImage(named: "Humidity")
        chanceImage.image = UIImage(named: "Rain_chance")
        windImage.image = UIImage(named: "Wind")
        
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        navigationItem.title = weatherForecast?.city?.name
        
        // Do any additional setup after loading the view.
    }
    
    func setUpSmallImages() {
        
        switch weatherForecast?.list?[0].weather![0].description {
        case "light rain"?:
            day1ImageName = "Weather5"
        case "overcast clouds"?:
            day1ImageName = "Weather1"
        case "clear sky"?, "few clouds"?:
            day1ImageName = "Weather3"
        case "scattered clouds"?, "broken clouds"?:
            day1ImageName = "Weather4"
        default:
            day1ImageName = "Weather3"
        }
         day1Image.image = UIImage(named:day1ImageName!)
        
        
        switch weatherForecast?.list?[8].weather![0].description {
        case "light rain"?:
            day2ImageName = "Weather5"
        case "overcast clouds"?:
            day2ImageName = "Weather1"
        case "clear sky"?, "few clouds"?:
            day2ImageName = "Weather3"
        case "scattered clouds"?, "broken clouds"?:
            day2ImageName = "Weather4"
        default:
            day2ImageName = "Weather3"
        }
        day2Image.image = UIImage(named:day2ImageName!)
        
        switch weatherForecast?.list?[16].weather![0].description {
        case "light rain"?:
            day3ImageName = "Weather5"
        case "overcast clouds"?:
            day3ImageName = "Weather1"
        case "clear sky"?, "few clouds"?:
            day3ImageName = "Weather3"
        case "scattered clouds"?, "broken clouds"?:
            day3ImageName = "Weather4"
        default:
            day3ImageName = "Weather3"
        }
        day3Image.image = UIImage(named:day3ImageName!)
        
        switch weatherForecast?.list?[24].weather![0].description {
        case "light rain"?:
            day4ImageName = "Weather5"
        case "overcast clouds"?:
            day4ImageName = "Weather1"
        case "clear sky"?, "few clouds"?:
            day4ImageName = "Weather3"
        case "scattered clouds"?, "broken clouds"?:
            day4ImageName = "Weather4"
        default:
            day4ImageName = "Weather3"
        }
        day4Image.image = UIImage(named:day4ImageName!)
        
        switch weatherForecast?.list?[32].weather![0].description {
        case "light rain"?:
            day5ImageName = "Weather5"
        case "overcast clouds"?:
            day5ImageName = "Weather1"
        case "clear sky"?, "few clouds"?:
            day5ImageName = "Weather3"
        case "scattered clouds"?, "broken clouds"?:
            day5ImageName = "Weather4"
        default:
            day5ImageName = "Weather3"
        }
        day5Image.image = UIImage(named:day5ImageName!)
    }
    
    func setDays ()
    {
        day1Name.text = getDayName(day: 0)
        day2Name.text = getDayName(day: 1)
        day3Name.text = getDayName(day: 2)
        day4Name.text = getDayName(day: 3)
        day5Name.text = getDayName(day: 4)
    }
    
    func getDayName(day: Int) -> String {
        let date = Date(timeIntervalSinceNow: TimeInterval(86400 * day))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    func setTemperatures() {
        bigTemperatureLabel.text = getTemperature(forecast: weatherForecast!, index: 0) + "C"
        day1Temp.text = getTemperature(forecast: weatherForecast!, index: 0)
        day2Temp.text = getTemperature(forecast: weatherForecast!, index: 8)
        day3Temp.text = getTemperature(forecast: weatherForecast!, index: 16)
        day4Temp.text = getTemperature(forecast: weatherForecast!, index: 24)
        day5Temp.text = getTemperature(forecast: weatherForecast!, index: 32)
    }
    
    func getHumidity(forecast: WeatherForecast, index: Int) -> String {
        return String(describing:(forecast.list?[index].main?.humidity)!) + "%"
    }
    
    func getTemperature(forecast: WeatherForecast, index: Int) ->String {
        return String(describing:
            Int(((forecast.list?[index].main?.temp)! - 273.15).rounded())) + "°"
        }

    func getWindSpeed(forecast: WeatherForecast, index: Int) ->String {
        return String(describing:(forecast.list?[index].wind?.speed)!) + "m/s"
    }
    func getRainProbability(forecast: WeatherForecast, index: Int) ->String {
        return String(describing:(forecast.list?[index].clouds?.all)!) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
