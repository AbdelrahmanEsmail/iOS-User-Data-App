//
//  DetailsViewController.swift
//  networking_task_ITI
//
//  Created by Abdelrahman Esmail on 21/08/2023.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var idText: String?
    var nameText: String?
    var ageText: String?
    var emailText: String?
    var genderText: String?
    var userimageText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLbl.text = "\(idText!)"
        nameLbl.text  = nameText
        ageLbl.text = "\(ageText!)"
        emailLbl.text = emailText
        genderLbl.text = genderText
        let url_image = URL(string: userimageText!)
        imgView.sd_setImage(with: url_image)
        imgView.layer.cornerRadius = 30 
    }

    @IBOutlet weak var showImgFromURL: UIImageView!
}
