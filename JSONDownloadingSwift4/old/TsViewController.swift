//
//  ViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit
import PopMenu
import LBTATools

class TsViewController: UIViewController, UITableViewDataSource {
    final let url = URL(string: "http://1.u0156265.z8.ru/old/next-tournaments.json")
    //  private var actors = [Actor]()
    @IBOutlet var nextt: [UITabBarItem]!
    
    private var tourneys = [Tourney]()
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
     //   createSpinnerView();
        navigationItem.title = "Home"
             navigationController?.navigationBar.isTranslucent = false
             
             let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
             titleLabel.text = "Home"
             titleLabel.textColor = .white
             titleLabel.font = UIFont.systemFont(ofSize: 20)
             navigationItem.titleView = titleLabel
             
        
    }
         /*
         let menuBar: MenuBar = {
             let mb = MenuBar()
             return mb
         }()*/
         
         private func setupMenuBar() {
            
         
           // view.addSubview(segmentedControl)
            
             //view.addSubview(menuBar)
           //  view.addConstraintsWithFormat("H:|[v0]|", views: segmentControl)
           //  view.addConstraintsWithFormat("V:|[v0(50)]", views: segmentControl)
         }
         
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    createSpinnerView()
    //     self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        downloadJson()
        tableView.tableFooterView = UIView()
     
    }
    func presentMenu() {
        let menuViewController = PopMenuViewController(actions: [
            PopMenuDefaultAction(title: "Action Title 1", image: UIImage(named: "icon")),
            PopMenuDefaultAction(title: "Action Title 2", image: UIImage(named: "icon"))
            ])
        present(menuViewController, animated: true, completion: nil)
    }
    public func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            let outputStr  = String(data: data, encoding: String.Encoding.utf8) as String!
            //print(outputStr)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourneys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? ActorCell else { return UITableViewCell() }
        
        cell.nameLbl.text = tourneys[indexPath.row].name
        // cell.DOBLbl.text = "DOB: " + persons[indexPath.row].dob
        cell.configure(tourney: tourneys[indexPath.row])
        cell.contentView.backgroundColor = UIColor.darkGray
        cell.backgroundColor = UIColor.darkGray
        /*
         if let imageURL = URL(string: actors[indexPath.row].image) {
         DispatchQueue.global().async {
         let data = try? Data(contentsOf: imageURL)
         if let data = data {
         let image = UIImage(data: data)
         DispatchQueue.main.async {
         cell.imgView.image = image
         }
         }
         }
         }  */
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // guard segue.identifier == "GoToDetails" else { return }
         if let cell = sender as? ActorCell {
        let controller = segue.destination as! ttabsBarController
            print(controller)
            print(cell.get_id())
        //print(controller.selectedViewController)
        controller.set_tid(tid: cell.get_id())
      
    }
    
    
    func createSpinnerView() {
        let child = SpinnerViewController()
        
        // add the spinner view controller
        addChildViewController(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
        
        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            // then remove the spinner view controller
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }
        
}
}
