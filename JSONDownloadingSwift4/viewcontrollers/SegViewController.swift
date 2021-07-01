//
//  ViewController.swift
//  SegmentedTableViewLBTA
//
//  Created by Brian Voong on 3/18/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit
import LBTATools
import PopMenu


class SegViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     final let url = URL(string: "http://1.u0156265.z8.ru/old/next-tournaments.json")
     private var tourneys = [Tourney]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourneys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var ttext = cell.textLabel! as UILabel
        ttext.text = tourneys[indexPath.row].name
        cell.textLabel?.numberOfLines = 0
     
        
        return cell
    }
    
    
    
        func tableView(_ tableView: UITableView,
       didSelectRowAt indexPath: IndexPath)
       
       {
       print(indexPath)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "pViewController") as! PlayersViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
         //   navigationController?.pushViewController(SerViewController(), animated: true)
        
       }
       
    
    
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Предстоящие", "Online" , "Прошедшие"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func handleSegmentChange() {
        print(segmentedControl.selectedSegmentIndex)
        
     /*   switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = games
        case 1:
            rowsToDisplay = tvShows
        default:
            rowsToDisplay = devices
        }
     */
        tableView.reloadData()
    }
    
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let moreButton = UIBarButtonItem(title: "...", style: .plain , target: self, action: #selector (handlemore))
             
             navigationItem.rightBarButtonItems = [moreButton]
             // Do any additional setup after loading the view.
         
         
       
        
        
        tableView.dataSource = self
        tableView.delegate = self
    
        view.backgroundColor = .white
        navigationItem.title = "Segmented Table View"
        
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [
            paddedStackView, tableView
            ])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }

    @objc func handlemore()
           {
            present(LoginFormController(alignment: .top), animated: true)
           }

    override func viewWillAppear(_ animated: Bool)
    {
        
        downloadJson()
    }
    
    public func downloadJson() {
            guard let downloadURL = url else { return }
            URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
                guard let data = data, error == nil, urlResponse != nil else {
                    print("something is wrong")
                    return
                }
                let outputStr  = String(data: data, encoding: String.Encoding.utf8) as String!
                //   print(outputStr)
                do
                {
                    let decoder = JSONDecoder()
                    let downloadedActors = try decoder.decode(Tourneys.self, from: data)
                    
                    self.tourneys = downloadedActors.tourneys
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                }.resume()
        }
}

