//
//  detalleTratamiento.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit

class detalleTratamiento: UIViewController, UITableViewDelegate, UITableViewDataSource {
      var numero = 0
    var arrayTreatments : Treatment =  Treatment()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayTreatments.getMedicine().count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
        cell.textLabel?.text = "Durante " + arrayTreatments.getSpecificMedicine(index: indexPath.row).getDuration()
         cell.detailTextLabel?.text = "Cada " +  arrayTreatments.getSpecificMedicine(index: indexPath.row).getFrecuency()
        print(arrayTreatments.getSpecificMedicine(index: indexPath.row).getDuration())
        return cell
    }
    

  
    
    @IBOutlet weak var doctorNombre: UILabel!
    
    @IBOutlet weak var fecha: UILabel!
    
    @IBOutlet weak var Notas: UILabel!
    
    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
      doctorNombre.text = arrayTreatments.getName()
        fecha.text = arrayTreatments.getDate()
        Notas.text = arrayTreatments.getNotes()
        print(arrayTreatments.getMedicine().count)
        tabla.delegate = self
        tabla.dataSource = self
//        cell.textLabel?.text = "Receta del Dr. \(arrayTreatments.getName())"
        // Do any additional setup after loading the view.
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
