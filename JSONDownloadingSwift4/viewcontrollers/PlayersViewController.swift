//
//  ViewController.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource {
  //  private var actors = [Actor]()
    public var Tid: String!
    private var players = [Player]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var controller =   self.tabBarController as! ttabsBarController
        Tid = controller.get_tid()
        downloadJson()
        tableView.tableFooterView = UIView()
    }
    
    

    func downloadJson() {
     
    let url_1 = "http://1.u0156265.z8.ru/old/index.php?id=29&t="
   // let url_2 = Tid ?? "t/3680617"
    let url = URL(string: url_1 + Tid)
     // print(Tid)
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
                    self.tableView.reloadData()
                }
            } catch {
              print(error)
            }
        }.resume()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // guard segue.identifier == "GoToDetails" else { return }
    
    }
}

