//
//  ViewController.swift
//  NewsApp
//
//  Created by USER on 13/09/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let newsRepository = NewsRepository()
    
    private var myData : [Articles]? = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        setupContainer()
        loadMyData()
    }
    func setupContainer(){
           self.tableView.delegate = self
           self.tableView.dataSource = self
           self.tableView.reloadData()
           self.tableView.separatorColor = UIColor.blue
       }
       
       func loadMyData() {
           newsRepository.getNewsRequest(custId: "1c92c0cc3285425fb8ee9c239548f7fc") { success in
               print(success)
             
            if let md = success.articles {
                   self.myData = md
               }
             self.tableView.reloadData()
           }
       }
   }
//For Downlode Image:
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
   extension  ViewController: UITableViewDataSource, UITableViewDelegate {
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 130
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return myData?.count ?? 0
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        
           if let md = myData?[indexPath.row] {
           
            cell.tittleLbl.text = md.title
            cell.descriptionLbl.text = md.description
               
            let urlString = md.urlToImage
            
            if urlString == nil {
                cell.newsImage.image = UIImage(named: "DefaultImage")
            }else {
                let url = URL(string: md.urlToImage!)
                cell.newsImage.downloaded(from: url!)
            }
 
          }
         return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let myNews = myData?[indexPath.row]
        guard let url1 = URL(string: myNews?.url ?? "" ) else {
            return
        }
let vc = SFSafariViewController(url: url1)
        present (vc,animated: true)
    }
    
   }
