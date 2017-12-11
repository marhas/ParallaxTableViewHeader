//
//  ViewController.swift
//  ParallaxTableHeader
//
//  Created by Marcel Hasselaar on 2017-12-11.
//  Copyright © 2017 Marcel Hasselaar. All rights reserved.
//
// Photo by Quino Al on Unsplash

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var tableHeaderContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
        topConstraint.isActive = true

        let relativeHeight = CGFloat(UIScreen.main.bounds.height) / 4
        if let tableHeaderView = tableView.tableHeaderView {
            tableView.tableHeaderView!.bounds = CGRect(origin: tableHeaderView.bounds.origin, size: CGSize(width: tableHeaderView.bounds.size.width, height: relativeHeight))
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "proto1")!
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
}

