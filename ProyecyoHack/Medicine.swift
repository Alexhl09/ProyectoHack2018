class Medicine {
	var quantity: String!
	var frecuency: String!
	var duration: String!
	var notes: String!

	init() {
		quantity = ""
		frecuency = ""
		duration = ""
		notes = ""
	}

	init (quantity: String, frecuency: String, duration: String, notes: String) {
		self.quantity = quantity
		self.frecuency = frecuency
		self.duration = duration
		self.notes = notes
	}

	func getQuantity() -> String {
		return self.quantity
	}
	func getFrecuency() -> String {
		return self.frecuency
	}
	func getDuration() -> String {
		return self.duration
	}
	func getNotes() -> String {
		return self.notes
	}

	func setQuantity(quantity: String) {
		self.quantity = quantity
	}
	func setFrecuency(frecuency: String) {
		self.frecuency = frecuency
	}
	func setDuration(duration: String) {
		self.duration = duration
	}
	func setNotes(notes: String) {
		self.notes = notes
	}
}
