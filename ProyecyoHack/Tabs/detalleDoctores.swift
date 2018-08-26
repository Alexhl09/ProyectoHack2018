
//
//  detalleDoctores.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit

class detalleDoctores: UIViewController {

    @IBOutlet weak var nombreDoc: UILabel!
    @IBOutlet weak var phoneDoc: UILabel!
    
    @IBOutlet weak var tituloDoc: UILabel!
    @IBOutlet weak var especialidadDoc: UILabel!
    @IBOutlet weak var cedulaDoc: UILabel!
    @IBOutlet weak var emailDoc: UILabel!
      var arrayDocs : Doctors =  Doctors()
    var numero : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
nombreDoc.text = arrayDocs.getName()
        phoneDoc.text = String(describing: arrayDocs.getPhone())
        tituloDoc.text = arrayDocs.getTitle()
        especialidadDoc.text = arrayDocs.getSpecialty()
        cedulaDoc.text = arrayDocs.getCedula()
        emailDoc.text = arrayDocs.getEMail()
        // Do any additional   setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
