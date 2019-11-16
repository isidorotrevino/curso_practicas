package ricardo

class Hospital {

	String nombre 

    static constraints = {
    }
	static mapping = {
		table 'hospital'
		version false
		id generator:'native', params:[sequence:'SEQ_HOSPITAL']
	}
	String toString(){
		return nombre
	}
}
