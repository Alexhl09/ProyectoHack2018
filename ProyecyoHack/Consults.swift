class Consults {
	var doctor: String!
	var specialty:  String!
	var treatment: String!
	var notes: String!
	var date: String!

	init() {
		self.doctor = ""
		self.specialty = ""
		self.treatment = ""
		self.notes = ""
		self.date = ""
	}

	init(doctor: String, specialty:  String, treatment: String, notes: String, date: String) {
		self.doctor = doctor
		self.specialty = specialty
		self.treatment = treatment
		self.notes = notes
		self.date = date
	}

	func getDoctor() -> String {
		return self.doctor
	}
	func getSpecialty() -> String {
		return self.specialty
	}
	func getTreatment() -> String {
		return self.treatment
	}
	func getDate() -> String {
		return self.date
	}

	func setDoctor(doctor: String) {
		self.doctor = doctor
	}
	func setSpecialty(specialty: String) {
		self.specialty = specialty
	}
	func setTreatment(treatment: String) {
		self.treatment = treatment
	}
	func setDate(date: String) {
		self.date = date
	}

}