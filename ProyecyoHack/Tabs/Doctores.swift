//
//  Doctores.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import Firebase

class Doctores: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var tabla: UITableView!
     var handle: AuthStateDidChangeListenerHandle?
    var indexSelected = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tabber = tabBarController as! TabHomeViewController
        print(tabber.doctores.count)
        return tabber.doctores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tabber = tabBarController as! TabHomeViewController
        cell.textLabel?.text = tabber.doctores[indexPath.row].getName()
        cell.detailTextLabel?.text = tabber.doctores[indexPath.row].getSpecialty()
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        let db = Firestore.firestore()
        
        
            
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print(indexSelected)
        self.performSegue(withIdentifier: "detalle", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalle"
        {
            let cc = segue.destination as! detalleDoctores
            cc.numero = indexSelected
            
            let tabber  = tabBarController as! TabHomeViewController
            cc.arrayDocs = tabber.doctores[indexSelected]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    @IBAction func regresarDoc(unwindSegue: UIStoryboardSegue)
    {
        
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
