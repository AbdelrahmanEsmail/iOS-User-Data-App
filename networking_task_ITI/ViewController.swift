//
//  ViewController.swift
//  networking_task_ITI
//
//  Created by Abdelrahman Esmail on 21/08/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var usersArray: [Users] = []
    @IBOutlet weak var TableViewMM: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = usersArray[indexPath.row].firstName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        DetailsViewController.idText = "\(usersArray[indexPath.row].id ?? 0)"
        DetailsViewController.nameText = "\(usersArray[indexPath.row].firstName ?? "") \(usersArray[indexPath.row].lastName ?? "") \(usersArray[indexPath.row].maidenName ?? "")"
        DetailsViewController.ageText = "\(usersArray[indexPath.row].age ?? 0)"
        DetailsViewController.emailText = usersArray[indexPath.row].email ?? ""
        DetailsViewController.genderText = usersArray[indexPath.row].gender ?? ""
        DetailsViewController.userimageText = usersArray[indexPath.row].userImage ?? ""
        navigationController?.pushViewController(DetailsViewController, animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URL(string: "https://dummyjson.com/users")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request!) { data, response, error in
            do{
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String,Any>
                let users = json["users"] as! [Dictionary<String,Any>]
                for user in users {
                    let userObj = Users()
                    userObj.id = user["id"] as? Int
                    userObj.firstName = user["firstName"] as? String
                    userObj.lastName = user["lastName"] as? String
                    userObj.maidenName = user["maidenName"] as? String
                    userObj.age = user["age"] as? Int
                    userObj.email = user["email"] as? String
                    userObj.gender = user["gender"] as? String
                    userObj.userImage = user["image"] as? String
                    self.usersArray.append(userObj)
                }
                DispatchQueue.main.async {
                    self.TableViewMM.reloadData() // Reload data once after processing
                }
            }catch{
                print("error")
            }
            
        }
        task.resume()
    }

}
