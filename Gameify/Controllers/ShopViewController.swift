//
//  ShopViewController.swift
//  Gameify
//
//  Created by Matthew Ramos on 8/30/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let items = ShopEquipmentList.list
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.dataSource = self
        itemsTableView.delegate = self

    }

}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as? ShopCell else { return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configureCell(equipment: item)
        return cell
    }
    
    
}

extension ShopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        itemDescriptionLabel.text = item.description
    }
}
