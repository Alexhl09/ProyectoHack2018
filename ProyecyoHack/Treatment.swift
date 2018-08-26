class Treatment {
	var date: String!
	var notes: String!
	var medicine: [Medicine]

	// Prescribed by
	var id: String!
	var name: String!

	init () {
		var medicine1: [Medicine] = []

		self.date = ""
		self.notes = ""
		self.medicine = medicine1
		self.id = ""
		self.name = ""
	}

	init (date: String, notes: String, medicine: [Medicine], id: String, name: String){
		self.date = date
		self.notes = notes
		self.medicine = medicine
		self.id = id
		self.name = name
	}

	func getDate() -> String {
		return self.date
	}
	func getNotes() -> String {
		return self.notes
	}
	func getMedicine() -> [Medicine] {
		return self.medicine
	}
	func getId() -> String {
		return self.id
	}
	func getName() -> String {
		return self.name
	}

	func setDate(date: String){
		self.date = date
	}
    func setNotes(notes: String) {
		self.notes = notes
	}
    func setMedicine(medicine: [Medicine]) {
		self.medicine = medicine
	}
    func setId(id: String) {
		self.id = id
	}
    func setName(name: String) {
		self.name = name
	}

	func getSpecificMedicine(index: Int) -> Medicine{
		return medicine[index]
	}
	func setSpecificMedicine(medicine: Medicine, index: Int) {
		self.medicine[index] = medicine
	}
}
