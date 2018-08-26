//
//  Patients.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import Foundation
class Patients : Person
{
    var treatment : [Treatment]!
    var consults : [Consults]!
    var studies : [LabStudies]!

    override init(){
    super.init()

    var treatments1 : [Treatment] = []
    var consults1 : [Consults] = []
    var studies1 : [LabStudies] = []

    self.treatment = treatments1
        self.consults = consults1
    self.studies = studies1

    }

    init(name: String, birthDate: String, phone: Int, email: String, treatment: [Treatment], consults: [Consults], studies : [LabStudies]){
    super.init(name: name, birthDate: birthDate, phone: phone, email: email)

    self.treatment = treatment
    self.consults = consults
    self.studies = studies
    }

    func getTreatments() -> [Treatment] {
        return treatment
    }
    func getConsults() -> [Consults] {
        return consults
    }
    func getStudies() -> [LabStudies]{
        return studies
    }

    func setTreatments(treatments: [Treatment]) {
        self.treatment = treatments
    }
    func setConsults(consults: [Consults]) {
        self.consults = consults
    }
    func setStudies(studies: [LabStudies]) {
        self.studies = studies
    }

    func getSpecificTreatment(index: Int) -> Treatment{
        return treatment[index]
    }
    func getSpecificConsults(index: Int) -> Consults{
        return consults[index]
    }
    func getSpecificStudies(index: Int) -> LabStudies{
        return studies[index]
    }

    func setSpecificTreatment(treatment: Treatment, index: Int) {
        self.treatment[index] = treatment
    }
    func setSpecificConsults(consult: Consults, index: Int) {
        self.consults[index] = consult
    }
    func setSpecificStudies(studies: LabStudies, index: Int) {
        self.studies[index] = studies
    }
}
