//
//  ViewController.swift
//  OLAM Timesheet
//
//  Created by Lateesh on 12/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayCollectionView: UICollectionView!
    @IBOutlet weak var monthLbl: UILabel!
    var subtractWeekFactor = 0
    var currentMonth: String!
    var timesheetItems = [DayModel]()
    var currentDayIndex = 0
    var highlightedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if subtractWeekFactor == 0 {
            highlightedIndex = getCurrentDayIndex()
        } else {
            highlightedIndex = 0
        }
        self.updateCollectionViewList()
    }

    func updateCollectionViewList() {

        let monday = getMondayOfCurrentWeek(currentDate: Calendar.current.date(byAdding: .day, value: (subtractWeekFactor*7), to: Date())!)
        self.timesheetItems.removeAll()
        for index in 0...6 {
            let iteratingDay = Calendar.current.date(byAdding: .day, value: index, to: monday)!
            self.timesheetItems.append(DayModel(day :iteratingDay.day ,month:iteratingDay.month ,date: iteratingDay.date,year: iteratingDay.year))
        }
        currentMonth = "\(timesheetItems[0].month!) \(timesheetItems[0].year)"
        self.monthLbl.text = currentMonth
        self.dayCollectionView.reloadData()
    }
    
    @IBAction func prevBtnClicked(_ sender: Any) {
        print("Prev btn clicked!")
        subtractWeekFactor = subtractWeekFactor - 1
        if subtractWeekFactor == 0 {
            highlightedIndex = getCurrentDayIndex()
        } else {
            highlightedIndex = 0
        }
        updateCollectionViewList()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        print("Next btn clicked!")
        if subtractWeekFactor < 0 {
            subtractWeekFactor = subtractWeekFactor + 1
        }
        if subtractWeekFactor == 0 {
            highlightedIndex = getCurrentDayIndex()
        } else {
            highlightedIndex = 0
        }
        updateCollectionViewList()
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 // 7 days of the week
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        cell.dayOfTheWeekLbl.text = timesheetItems[indexPath.row].day.prefix(3).uppercased()
        cell.dateLbl.text = timesheetItems[indexPath.row].date
        if indexPath.row == highlightedIndex {
            cell.dayOfTheWeekLbl.font = UIFont.boldSystemFont(ofSize: 17.0)
            cell.dayOfTheWeekLbl.textColor = UIColor.purple
            cell.dateLbl.font = UIFont.boldSystemFont(ofSize: 14.0)
            cell.dateLbl.textColor = UIColor.purple
        } else {
            cell.dayOfTheWeekLbl.font = UIFont.systemFont(ofSize: 17.0)
            cell.dayOfTheWeekLbl.textColor = UIColor.black
            cell.dateLbl.font = UIFont.systemFont(ofSize: 14.0)
            cell.dateLbl.textColor = UIColor.black
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        highlightedIndex = indexPath.row
        dayCollectionView.reloadData()
    }
}
