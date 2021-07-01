//
//  ViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit
import LBTATools

class PlayersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
  //  private var actors = [Actor]()
    
    private var players = [Player]()
   @IBOutlet var nextt: UITabBarItem!
    @IBOutlet var tview: UITableView!

     public var tId: String = ""
    
      let segmentedControl: UISegmentedControl = {
          let sc = UISegmentedControl(items: ["Игроки", "Описание" , "Сетка"])
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
          tview.reloadData()
      }
     
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
      tview.delegate = self
       tview.dataSource = self
       downloadJson()
        print(players)
  //      tableView.tableFooterView = UIView()
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
             paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
             paddedStackView.isLayoutMarginsRelativeArrangement = true
             
             let stackView = UIStackView(arrangedSubviews: [
                 paddedStackView, tview
                 ])
             stackView.axis = .vertical
             
             view.addSubview(stackView)
             stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }
    
      func set_tid(tid: String) {
          self.tId = tid        // configure the labels, etc in the cell
      }
      func get_tid() -> String{
      
          return self.tId
      }
      
    

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? ActorCell else { return UITableViewCell() }
        
        cell.nameLbl.text = players[indexPath.row].name
        cell.DOBLbl.text = "ЭЛО: " + players[indexPath.row].elo
    
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
  
    func downloadJson() {
        
       let url_1 = "http://1.u0156265.z8.ru/old/index.php?id=29&t="
      let url_2 =  "t/3986846"
           //get_tid() ??
       let url = URL(string: url_1 + url_2)
         print(url)
          // print(url_1+url_2)
           guard let downloadURL = url else { return }
           URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
               guard let data = data, error == nil, urlResponse != nil else {
                   print("something is wrong")
                   return
               }
               let outputStr  = String(data: data, encoding: String.Encoding.utf8) as String!
               print(outputStr)
               do
               {
                   let decoder = JSONDecoder()
                   let downloadedActors = try decoder.decode(Players.self, from: data)
                   
                   self.players = downloadedActors.players
                   DispatchQueue.main.async {
                   
                       self.tview.reloadData()
                   }
               } catch {
                 print(error)
               }
           }.resume()
       }
}

