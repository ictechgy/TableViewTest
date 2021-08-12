//
//  ViewController.swift
//  TableViewTest
//
//  Created by JINHONG AN on 2021/08/12.
//

import UIKit

class ListViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    //MARK: Properties
    private let totalSectionCount = 10
    private let fixedLowCount = 2
    private let cellLabelDecorationSectionDeadline = 4
    private let cellBackgroundDecorationRowValue = 3
    private let networkManager = NetworkManager()

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
}

//MARK:- Conform to DataSource
extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        totalSectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section + fixedLowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BasicCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var cellConfiguration = cell.defaultContentConfiguration()
        
        //cell.prepareForReuse() - 잘 알고 쓰자
        if indexPath.row == cellBackgroundDecorationRowValue {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .white
        }
        if indexPath.section <= cellLabelDecorationSectionDeadline {
            cellConfiguration.text = "(\(indexPath.section), \(indexPath.row))"
        } else {
            cellConfiguration.text = nil
        }
        if let url = CellNumber(rawValue: indexPath.row)?.imageURL {
            networkManager.receiveImage(of: url) { image in
                if tableView.indexPath(for: cell) == indexPath {
                    cellConfiguration.image = image
                    cell.contentConfiguration = cellConfiguration
                }
            }
        }
        cellConfiguration.image = nil
        cell.contentConfiguration = cellConfiguration
        
        return cell
    }
}
